require "spec_helper"


module Twitchus
  describe Config do

    let(:config) { Config.new }

    it "load config with multiple streams" do
      file =<<YAML
streams:
  - scvrush1
  - scvrush2
YAML
      File.write("./tmp/config.yml", file)
      config.load("./tmp/config.yml")
      config.streams.should == %w{scvrush1 scvrush2}
    end

    it "loads client key" do
      file =<<YAML
client_key: foo
YAML
      File.write("./tmp/config.yml", file)
      config.load("./tmp/config.yml")
      config.client_key.should == "foo"
    end

  end
end
