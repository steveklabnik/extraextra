require 'mongo'
include Mongo

module Extra

  # Extra is the main class in Extra! Extra! It's what gets returned from
  # queries, and is the main interface to the entire system. 
  class Extra

    attr_accessor :category,
                  :who_id, 
                  :who_name,
                  :who_class,
                  :what,
                  :when

    # For now, this is just a simple sentence describing what happened.
    # We'll see if something more complex makes sense later.
    def to_s
      "#{who_name} #{what}"
    end

    class << self
      attr_accessor :db, :collection

      # The source method is used to set up the connection to MongoDB. Right now
      # it has to be called by the user before doing anything else, which sucks.
      # I'll probably add in something to make it autoconnect soon.
      def source opts={}
        opts[:host] ||= "localhost"
        opts[:port] ||= 27017
        self.db = Mongo::Connection.new(opts[:host], opts[:port]).db("extraextra")
        self.collection = db["extras"]
      end

      # Extra::Extra.! is the method used to report what's going on. It takes a
      # symbol for a category, the user who did whatever's newsworthy, and some
      # text that describes what happened.
      def !(category, user, text)

        args = {
          category: category,
          who_id: user.id,
          who_name: user.username,
          who_class: user.class.to_s,
          what: text,
          when: Time.now.to_s 
        }
        collection.insert args
        Extra.new args
      end

      # This method returns all Extras that are associated with a given person.
      def read_all_about_it user
        
        collection.find(who_id: user.id,
                        who_class: user.class.to_s
                       ).collect{|args| Extra.new args }
        
      end
    end

  end
end
