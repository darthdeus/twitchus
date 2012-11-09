require "rest-client"
require "json"

module Twitchus
  class Checker

    def fetch_all(channels, timeout = 0)
      channels.map { |channel| check(channel); sleep timeout if timeout }.select { |c| !c.nil? }
    end

    # Return a list of online channel names
    def check_all(channels)
      channels.select { |channel| online?(channel) }
    end

    def check(channel)
      raise ArgumentError, "Channel is required." unless channel
      response = JSON.parse(RestClient.get(base_url + channel))

      response.first
    rescue RestClient::BadRequest => e
      $stderr.puts "RestClient::BadRequest for #{channel}, #{e}"
      nil
    end

    def online?(channel)
      !check(channel).nil?
    end

    def base_url
      "http://api.justin.tv/api/stream/list.json?channel="
    end
  end
end
