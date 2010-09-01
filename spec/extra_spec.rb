require_relative "../lib/extra.rb"

describe Extra::Extra do
  it "should exist" do
    extra = Extra::Extra.new
  end

  describe "#source" do
    it "should exist" do
      Extra::Extra.source
    end

    it "should set Candy.host and Candy.port" do
      Candy.should_receive(:host=).with("localhost")
      Candy.should_receive(:port=).with(1337)
      Extra::Extra.source :host => "localhost", :port => 1337
    end

  end
end
