module Twitchus
  class Worker
    def initialize(config_file)
      @config = Twitchus::Config.new
      @config.load(config_file)
      @checker = Twitchus::Checker.new(config)
    end

    def run
      @storage = Twitchus::Storage.new(@config.host, @config.port, @config.key)
      # Empty the online channel list first
      @storage.clear

      online_channels = @checker.fetch_all(@config.channels, 0.5)
      online_channels.each do |channel|
        next if Integer === channel

        data = {
          name:    channel["title"],
          channel: c["login"],
          image:   c["image_url_huge"]
        }

        @storage.push data.to_json
      end
    end
  end

end
