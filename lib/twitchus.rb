require "twitchus/version"
require "twitchus/cli"


module Twitchus

  class Config
    attr_reader :streams

    def load(file)
      File.open(file) do |f|
        @streams = f.readlines.map(&:strip)
      end
    end
  end
end
