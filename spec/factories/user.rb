# we just want a dummy user
class User

  def save!; end
  def id=(id); end
  def id; 1 end
  def username=(username); end
  def username; "steve" end
  def self.find(id); User.new end

end

Factory.define :user do |u|
end
