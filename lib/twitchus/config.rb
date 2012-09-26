require "yaml"

module Twitchus
  class Config
    attr_reader :streams

    def load(file)
      @data = YAML.load_file(file)
      @streams = @data["streams"]
    end

    def host
      @data["host"]
    end

    def port
      @data["port"]
    end

    def key
      @data["key"]
    end

    # TODO - remove duplication
    def channels
      @streams
    end

  end
end
