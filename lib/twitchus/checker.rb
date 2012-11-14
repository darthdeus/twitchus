require "rest-client"
require "json"

module Twitchus
  class Checker
    def initialize(config = nil)
      @config = config
    end

    def fetch_all(channels)
      channels.map { |channel| check(channel) }.select { |c| !c.nil? }
    end

    # Return a list of online channel names
    def check_all(channels)
      channels.select { |channel| online?(channel) }
    end

    def check(channel)
      raise ArgumentError, "Channel is required." unless channel
      response = RestClient.get(base_url + channel)
      response = JSON.parse(response)

      response["stream"]
    rescue RestClient::BadRequest => e
      $stderr.puts "Request failed due to rate limit, channel: #{channel}, #{e}"
      nil
    end

    def online?(channel)
      !check(channel).nil?
    end

    def url_for(channel)
      url = base_url + channel
      url += "?client_key=#{@config.client_key}" if @config
      url
    end

    def base_url
      "https://api.twitch.tv/kraken/streams/"
    end
  end
end
