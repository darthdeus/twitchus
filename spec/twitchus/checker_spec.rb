require "spec_helper"

module Twitchus

  describe Checker do
    context "without a config" do
      let(:checker) { Checker.new }

      it "can tell if a channel is online" do
        stub_request(:get, "https://api.twitch.tv/kraken/streams/scvrush1")
          .to_return(status: 200, body: { "stream" => {} }.to_json)

        checker.should be_online("scvrush1")
      end

      it "handles when a request timeouts" do
        stub_request(:get, "https://api.twitch.tv/kraken/streams/scvrush1").to_timeout
        checker.should_not be_online("scvrush1")
      end

      it "handles various http errors" do
        [400, 404, 422, 503].each do |error|
          stub_request(:get, "https://api.twitch.tv/kraken/streams/scvrush1")
            .to_return(status: error)

          checker.should_not be_online("scvrush1")
        end
      end

      it "can tell if a channel is offline" do
        stub_request(:get, "https://api.twitch.tv/kraken/streams/scvrush1")
          .to_return(status: 200, body: { "stream" => nil }.to_json)

        checker.should_not be_online("scvrush1")
      end

      it "selects online streams from a list" do
        stub_request(:get, "https://api.twitch.tv/kraken/streams/online")
          .to_return(status: 200, body: { "stream" => { "name" => "online"} }.to_json)
        stub_request(:get, "https://api.twitch.tv/kraken/streams/offline")
          .to_return(status: 200, body: { "stream" => nil }.to_json)

        checker.fetch_all(%w(online offline)).should == [ { "name" => "online" } ]
      end
    end

    context "with a config" do
      let(:config)  { Struct.new(:client_key).new("foobarkey") }
      let(:checker) { Checker.new(config) }

      it "appends the client key to base_url" do
        checker.url_for("scvrush1").should == "https://api.twitch.tv/kraken/streams/scvrush1?client_key=foobarkey"
      end
    end

  end
end
