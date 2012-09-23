require "spec_helper"


describe Twitchus::Config do

  let(:config) { Twitchus::Config.new }

  it "can load a file" do
    File.write("./tmp/config.yml", "scvrush")
    config.load("./tmp/config.yml")
    config.streams.should include("scvrush")
  end

end
