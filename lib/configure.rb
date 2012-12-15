module Configure
  def self.read()
    begin
      config = {}
      File.open(path, 'r') do |file|
        file.each do |row|
          row.chomp!
          cols = row.split(/\s+=\s+/)
          config[cols[0].to_sym] = cols[1]
        end
      end
    rescue
      config = {}
    ensure
      return config
    end
  end

  def self.write(config)
    File.open(path, 'w') do |file|
      config.each do |key, value|
        file.puts "#{key} = #{value}"
      end
    end
  end

  def self.make
    config = self.read

    puts
    config[:hostname] ||= 'api.example.com'
    print "Hostname (#{config[:hostname]}): "
    stdin = STDIN.gets.chomp.to_s
    config[:hostname] = stdin if !stdin.empty?

    config[:username] ||= ENV['USER']
    print "Username (#{config[:username]}): "
    stdin = STDIN.gets.chomp.to_s
    config[:username] = stdin if !stdin.empty?

    config[:password] ||= ''
    print "Password: "
    stdin = STDIN.gets.chomp.to_s
    config[:password] = stdin if !stdin.empty?

    config[:version] ||= '~6.5 '
    print "Version (#{config[:version]}): "
    stdin = STDIN.gets.chomp.to_s
    config[:version] = stdin if !stdin.empty?

    puts
    puts "New settings:"
    puts "Hostname: #{config[:hostname]}"
    puts "Username: #{config[:username]}"
    puts "Password:"
    puts "Version: #{config[:version]}"
    puts

    self.write config
  end

  private

  def path
    config = '.sdccfg'
    file = File.join(File.dirname(__FILE__), '..', config)
    if File.exist?(file)
      file
    else
      File.join(ENV["HOME"], config)
    end
  end
end
