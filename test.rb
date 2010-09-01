require './lib/extra/extra.rb'

class User
	attr_accessor :id, :username
end

steve = User.new
steve.id = 1
steve.username = "steve"

Extra::Extra.source

Extra::Extra.! :breaking, steve, "won at everything!"

extras = Extra::Extra.read_all_about_it(steve)

extras.each do |extra|
	puts extra.to_s
end
