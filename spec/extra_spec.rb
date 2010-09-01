require_relative "../lib/extra.rb"

describe Extra::Extra do
  describe "#source" do
    it "should exist" do
      Extra::Extra.respond_to?(:source).should == true
    end

    it "should set up a connection" do
      obj = mock("Connection")
      db = mock("db")
      db.should_receive(:[])
      obj.should_receive(:db).with("extraextra").and_return(db)
      Mongo::Connection.should_receive(:new).with("localhost", 1337).and_return(obj)
      Extra::Extra.should_receive(:db=).and_return(db)
      Extra::Extra.should_receive(:db).and_return(db)
      
      Extra::Extra.source :host => "localhost", :port => 1337
    end
  end

  describe "self#!" do

    it "should take three args and save them" do
      #holy setup batman
      collection = mock("collection")
      Extra::Extra.should_receive(:collection).and_return(collection)
      collection.should_receive(:insert).with(:category => :breaking, :who_id => 1, :who_name => "steve", :who_class => 'User', :what => "hit a home run", :when => Time.now.to_s)

      user = mock("User", :id => 1, :class => 'User', :username => "steve")
      Extra::Extra::! :breaking, user, "hit a home run"
    end
  end

  describe "#read_all_about_it" do

    it "should exist" do
      Extra::Extra.respond_to?(:read_all_about_it).should == true
    end

    it "should return Extras for the user" do
      user = mock("User", :id => 1, :class => "User")
      extra = mock("Extra")
      collection = mock("collection")
      collection.should_receive(:find).with(:who_id=>1, :who_class=>"User").and_return([extra])
      Extra::Extra.should_receive(:collection).and_return(collection)
      
      extras = Extra::Extra.read_all_about_it(user)
      extras.should == [extra]
    end
  end
end
