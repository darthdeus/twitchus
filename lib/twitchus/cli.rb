require "optparse"

module Twitchus
  class Cli

    attr_reader :options

    def initialize
      @options = {}
    end

    def parser
      @parser ||= OptionParser.new do |opts|

        opts.on("-c CONFIG", "Specify a config file.") do |config|
          @options[:config] = config
        end

        opts.on( "-h", "--help", "Display this message.") do |h|
          $stdout.puts opts.to_s
          exit 0
        end

        opts.on( "-v", "--version", "Output the version of Twitchus.") do |v|
          $stdout.puts "Twitchus version #{Twitchus::VERSION}"
          exit 0
        end

      end
    end

    def parse(argv, env)
      parser.parse! argv

      if @options[:config]
        if File.exists? @options[:config]
          worker = Twitchus::Worker.new(@options[:config])
          worker.run

          exit 0
        else
          raise OptionParser::ParseError, "The config file you specified doesn't exist"
        end
      else
        raise OptionParser::ParseError, "You must specify a config file."
      end

      return true
    rescue OptionParser::ParseError => e
      $stderr.puts e
      $stderr.puts
      $stderr.puts parser.help
      exit 1
    end

    def run(argv = ARGV, env = ENV)
      parse(argv, env)
    end

  end

end
