require "spec_helper"


module Twitchus
  describe Config do

    let(:config) { Config.new }

    it "can load a file" do
      File.write("./tmp/config.yml", "scvrush1")
      config.load("./tmp/config.yml")
      config.streams.should include("scvrush1")
    end

    it "can load config with multiple streams" do
      File.write("./tmp/config.yml", "scvrush1\nscvrush2")
      config.load("./tmp/config.yml")
      config.streams.should == %w{scvrush1 scvrush2}
    end

  end
end
