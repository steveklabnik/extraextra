# we just want a dummy user
class User
  attr_accessor :id
  attr_accessor :username

  def save!; end
  def self.find(id); User.new(:id => id, :username => "somebody") end

end

Factory.define :user do |u|
end
