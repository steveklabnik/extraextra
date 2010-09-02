require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Extra::Extra do
  describe "self#source" do
    it "should exist" do
      Extra::Extra.respond_to?(:source).should == true
    end

    it "should set up a connection" do
      obj = mock("Connection")
      db = mock("db")
      db.should_receive(:[])
      obj.should_receive(:db).with("extraextra").twice.and_return(db)
      Mongo::Connection.should_receive(:new).twice.and_return(obj)
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
      collection.should_receive(:insert).with('category' => :breaking, 'who_id' => 1, 'who_name' => "steve", 'who_class' => 'User', 'what' => "hit a home run", 'when' => Time.now.to_s)

      user = mock("User", :id => 1, :class => 'User', :username => "steve")
      Extra::Extra::! :breaking, user, "hit a home run"
    end
  end

  describe "self#read_all_about_it" do

    it "should exist" do
      Extra::Extra.respond_to?(:read_all_about_it).should == true
    end

    it "should return Extras for the user" do
      user = Factory(:user)
      Extra::Extra.source
      extra = Extra::Extra::! :breaking, user, "hit a home run"
      
      extras = Extra::Extra.read_all_about_it(user)
      extras.length.should == 1
      ex = extras.first
      ex.category.should == extra.category
      ex.who_id.should == user.id
      ex.who_name.should == user.username
      ex.who_class.should == user.class.to_s
      ex.what.should == extra.what
      ex.when.should == extra.when
      ex.to_s.should == extra.to_s
    end
  end

  describe "self#the_scoop" do
    it "should exist" do
      Extra::Extra.respond_to?(:the_scoop).should == true
    end
  end

  describe "#who" do
    it "should instantiate the object" do
      user = Factory(:user)
      Extra::Extra.source
      extra = Extra::Extra::! :breaking, user, "hit a home run"

      u = extra.who
      u.class.should == User
      u.id.should == user.id
    
    end

  end

  describe "#*_news" do

    it "should filter some news" do
      user = Factory(:user)
      Extra::Extra.source
      extra = Extra::Extra::! :breaking, user, "hit a home run"
      extra = Extra::Extra::! :boooring, user, "just ran a test"

      Extra::Extra.breaking_news.length.should == 1

    end
  end
end
