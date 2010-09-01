EXTRA! EXTRA! READ ALL ABOUT IT!
================================

Need to add a news feed to your application? EXTRA! EXTRA! is just the Gem 
for you! This is a common need for many social applications. EXTRA! EXTRA! 
uses MongoDB to give you super fast, super convenient feeds.

## Install ##################################################################

EXTRA! EXTRA! will be distributed via Rubygems, so just 

    $ gem install extraextra

and you'll be reading the news in no time!


## Source ###################################################################

The source of EXTRA! EXTRA! is on GitHub, and can be found here:

    http://github.com/steveklabnik/extraextra

It can be cloned via

    $ git clone git://github.com/steveklabnik/extraextra.git

## Requirements #############################################################

* **Ruby 1.9** Sorry for you 1.8 people, 1.9 is the current version of Ruby.
* **candy** Simple, lightweight, 'orm' for MongoDB. 
* **MongoDB 1.4** This is a candy requirement, and 1.6 is current, anyway.

## Usage ####################################################################

The first thing you'll need to do is configure EXTRA! EXTRA! to use your 
MongoDB installation. 

    Extra::Extra.source :host => "localhost", :port => "1337"

To record something newsworthy, just do this:

    $ Extra::Extra::! :breaking, user, "has just done something awesome!"

To find out what interesting things a particular user has done:

    $ Extra::Extra.read_all_about_it user

or

    $ Extra::Extra.the_scoop user

This returns an array of Extra objects. To find out more about a particular
 Extra:

    $ extra = Extra::Extra::! :sports, user, "hit a home run!"

    $ extra.who?
     => #<User:0x0000010089ea80> 
    $ extra.what?
     => "hit a home run"
    $ extra.where?
     => nil # currently undecided
    $ extra.when?
     => 1283311813 
    $ extra.how?
     => nil # currently undecided
    $ extra.to_s
     => "Steve hit a home run"

The name in to_s comes from user#username. If you use something else... 
I'll provide a way to override this eventually.

To only see breaking news:

    $ user.breaking_news

This will filter out only the news in the 'breaking' category.

To find out what interesting things a users's friends have done:

    $ user.scope_the_scene

To define what who you're friends with, make a method on your user model
named my_peeps. For a (hypothetical) example:

    class User
      def my_peeps
        User.friends.collect(&:id)
      end
    end

The my_peeps method should return an Array of ids. This method will be 
called during scope_the_scene to determine what results get returned.

## Contributing #############################################################

Fork, commit, pull request. Bonus points for topic branches and great commit
messages.

In particular, I will accept most patches that add good aliases for methods.

## This is just a cleverly named logging framework ##########################

No, it's not. Shut up.
