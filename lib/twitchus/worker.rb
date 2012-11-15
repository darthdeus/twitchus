# encoding: utf-8
module Twitchus
  class Worker
    def initialize(config_file)
      @config = Twitchus::Config.new
      @config.load(config_file)
      @checker = Twitchus::Checker.new(@config)
    end

    def run
      @storage = Twitchus::Storage.new(@config.host, @config.port, @config.key)
      # Since this can run periodically, clean the list first
      @storage.clear

      online_streams = @checker.fetch_all(@config.streams)
      online_streams.each do |data|
        channel = data["channel"]
        data = {
          title:   channel["status"],
          name:    channel["name"],
          image:   channel["video_banner"],
          preview: data["preview"]
        }

        @storage.push data.to_json
      end
    end
  end

end
