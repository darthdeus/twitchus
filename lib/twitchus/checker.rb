require "rest-client"
require "json"

module Twitchus
  class Checker

    def fetch_all(channels)
      channels.map { |channel| check(channel) }.select { |c| !c.nil? }
    end

    # Return a list of online channel names
    def check_all(channels)
      channels.select { |channel| online?(channel) }
    end

    def check(channel)
      raise ArgumentError, "Channel is required." unless channel
      response = JSON.parse(RestClient.get(base_url + channel))

      return response.first
    end

    def online?(channel)
      !check(channel).nil?
    end

    def base_url
      "http://api.justin.tv/api/stream/list.json?channel="
    end
  end
end
