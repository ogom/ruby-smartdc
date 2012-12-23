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

  def self.init
    config = self.read

    output = <<EOS
              .
              |
 .-.  .--. .-.|  .-.
: + : `--.(   | (   
 `-'  `--' `-'`- `-'
      Smart Data Center Command Line Interface
      http://apidocs.joyent.com/sdcapidoc/cloudapi/
      
EOS
    puts output

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

  def self.key(keys)
    config = self.read
    use_key = 0
    rsa_path = nil

    puts "SSH Key Settings:"
    keys.each_with_index do |key, i|
      puts "#{i+1}) #{key['name']}"
    end

    if !keys.empty?
      puts "0) Add new key"
      print "Select SSH key: "
      stdin = STDIN.gets.chomp.to_s
      use_key = stdin.to_i if !stdin.empty?
    end

    if use_key > 0
      config[:use_key] = keys[use_key-1]['name']
    else
      config[:use_key] ||= 'id_rsa'
      print "Key name (#{config[:use_key]}): "
      stdin = STDIN.gets.chomp.to_s
      config[:use_key] = stdin if !stdin.empty?        

      rsa_path = File.join(ENV["HOME"], '/.ssh/id_rsa.pub')
      print "Public key path (#{rsa_path}): "
      stdin = STDIN.gets.chomp.to_s
      rsa_path = stdin if !stdin.empty?
    end

    config[:rsa_path] ||= File.join(ENV["HOME"], '/.ssh/id_rsa')
    print "Private key path (#{config[:rsa_path]}): "
    stdin = STDIN.gets.chomp.to_s
    config[:rsa_path] = stdin if !stdin.empty?
    puts

    self.write config
    rsa_path
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
