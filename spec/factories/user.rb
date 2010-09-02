# we just want a dummy user
class User
  attr_accessor :id
  attr_accessor :username
  attr_accessor :friends

  def save!; end

  def self.find(id)
    User.new(:id => id, :username => "somebody", :friends => [])
  end

  def my_peeps
    friends
  end

end

Factory.define :user do |u|
end
