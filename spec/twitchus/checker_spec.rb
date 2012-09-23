require "spec_helper"

module Twitchus

  describe Checker do

    let(:c) { Checker.new }

    it "can tell if a channel is online" do
      VCR.use_cassette "justin.tv", record: :new_episodes do
        c.should be_online("dreamhacktv")
      end
    end

    it "can tell if a channel is offline" do
      VCR.use_cassette "justin.tv", record: :new_episodes do
        c.should_not be_online("scvrush1")
      end
    end

  end

end
