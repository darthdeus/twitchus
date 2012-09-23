require "twitchus/version"

module Twitchus
  class Config
    attr_reader :streams

    def load(file)
      @streams = ["scvrush"]
    end
  end
end
