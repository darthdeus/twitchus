require "redis"

module Twitchus
  class Storage

    def initialize(host, port, key)
      @client = Redis.new(host: host, port: port)
      @key = key
    end

    # Add an item to the list specified in config
    def push(item)
      @client.lpush(@key, item) if item
    end

    def clear
      @client.expire @key, -1
    end

  end
end
