require "yaml"

module Twitchus
  class Config
    attr_reader :streams

    def load(file)
      @data = YAML.load_file(file)
      @streams = @data["streams"]
    end
  end
end
