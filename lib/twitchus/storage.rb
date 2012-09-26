require "redis"
require "pry"

module Twitchus
  class Storage

    def initialize(host, port, key)
      @client = Redis.new(host: host, port: port)
      @key = key
    end

    def push(item)
      @client.lpush(@key, item) if item
    end

  end
end
