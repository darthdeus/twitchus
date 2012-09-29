module Twitchus
  class Worker
    def initialize(config_file)
      @config = Twitchus::Config.new
      @config.load(config_file)
      @checker = Twitchus::Checker.new
    end

    def run
      @storage = Twitchus::Storage.new(@config.host, @config.port, @config.key)
      # Empty the online channel list first
      @storage.clear

      online_channels = @checker.fetch_all(@config.channels)
      online_channels.each do |channel|
        data = {
          name: channel["title"],
          channel: channel["channel"]["login"],
          image: channel["channel"]["image_url_huge"]
        }

        @storage.push data.to_json
      end
    end
  end

end
