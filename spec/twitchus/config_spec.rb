require "spec_helper"


module Twitchus
  describe Config do

    let(:config) { Config.new }

    it "can load config with multiple streams" do
      file =<<YAML
streams:
  - scvrush1
  - scvrush2
YAML
      File.write("./tmp/config.yml", file)
      config.load("./tmp/config.yml")
      config.streams.should == %w{scvrush1 scvrush2}
    end

  end
end
