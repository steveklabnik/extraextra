require_relative "../lib/extra.rb"

describe Extra::Extra do
  it "should exist" do
    extra = Extra::Extra.new
  end

  describe "#source" do
    it "should exist" do
      Extra::Extra.respond_to?(:source).should == true
    end

    it "should set Candy.host and Candy.port" do
      Candy.should_receive(:host=).with("localhost")
      Candy.should_receive(:port=).with(1337)
      Extra::Extra.source :host => "localhost", :port => 1337
    end
  end

  describe "self#!" do

    it "should take three args and save them" do
      #holy setup batman
      extra = mock("Extra")
      Extra::Extra.should_receive(:new).and_return(extra)
      extra.should_receive(:category=).with(:breaking)
      extra.should_receive(:who_id=).with(1)
      extra.should_receive(:who_name=).with("steve")
      extra.should_receive(:who_class=).with('User')
      extra.should_receive(:what=).with("hit a home run")
      extra.should_receive(:when=)

      user = mock("User", :id => 1, :class => 'User', :username => "steve")
      Extra::Extra::! :breaking, user, "hit a home run"
    end
  end
end
