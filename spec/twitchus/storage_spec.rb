require "spec_helper"

module Twitchus

  describe Storage do

    it "will add things to the given key" do
      client = mock(:redis)
      client.should_receive(:lpush).with(:key, :item)

      Redis.should_receive(:new) { client }

      storage = Storage.new(1, 1, :key)
      storage.push :item
    end

    it "won't add empty items to the list" do
      client = mock(:redis)
      client.should_not_receive(:lpush).with(:key, nil)

      Redis.should_receive(:new) { client }

      storage = Storage.new(1, 1, :key)
      storage.push nil
    end

  end
end

