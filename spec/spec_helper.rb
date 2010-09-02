$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'extraextra'
require 'spec'
require 'spec/autorun'
require 'factory_girl'

Dir.glob(File.join(File.dirname(__FILE__), '/factories/*.rb')).each do |factory|
  require factory
end


Spec::Runner.configure do |config|

  config.mock_with :rspec

  config.after(:each) do

    db   = Connection.new.db('extraextra')
    unless db.class.to_s == "Spec::Mocks::Mock" 
    coll = db.collection('extras')
      coll.remove
    end
  end
  
end
