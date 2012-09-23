require "rest-client"
require "json"

module Twitchus
  class Checker

    def initialize
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
