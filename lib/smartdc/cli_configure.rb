module Smartdc
  class CliConfigure
    attr_reader :path

    def initialize(path=nil)
      if path
        @path =path
      else
        [Smartdc.root, ENV['HOME']].each do |path|
          @path = File.join(path, '.sdccfg')
          break if File.exist?(@path)
        end
      end
    end

    def read
      begin
        options = {}
        File.open(path, 'r') do |file|
          file.each do |row|
            row.chomp!
            cols = row.split(/\s+=\s+/)
            options[cols[0].to_sym] = cols[1]
          end
        end
        options
      rescue
        {}
      end
    end

    def write(options)
      File.open(path, 'w') do |file|
        options.each do |key, value|
          file.puts "#{key} = #{value}"
        end
      end
      options
    end

    def init
      output = <<__EOS__
                .
                |
   .-.  .--. .-.|  .-.
  : + : `--.(   | (
   `-'  `--' `-'`- `-'
        Smart Data Center Command Line Interface
        https://apidocs.joyent.com/sdcapidoc/cloudapi/
__EOS__
      puts output
      puts

      options = self.read
      options = option(options, :Hostname, :hostname, 'api.example.com')
      options = option(options, :Version, :version, '~7.0')
      options = option(options, :Username, :username, ENV['USER'])
      options = option(options, :Fingerprint, :use_key, 'none')

      puts
      puts "New settings!"
      puts "Hostname: #{options[:hostname]}"
      puts "Version: #{options[:version]}"
      puts "Username: #{options[:username]}"
      puts "Fingerprint: #{options[:use_key]}"
      puts

      self.write options
    end

    private
      def option(options, name, key, value)
        options[key] ||= value
        print "#{name} (#{options[key]}): "
        stdin = STDIN.gets.chomp.to_s
        options[key] = stdin if !stdin.empty?
        options
      end
    # end private
  end
end
