require 'mongo'
include Mongo

module Extra

  class Extra


    class << self
      attr_accessor :db, :collection

      def source opts={}
        opts[:host] ||= "localhost"
        opts[:port] ||= 27017
        self.db = Mongo::Connection.new(opts[:host], opts[:port]).db("extraextra")
        self.collection = db["extras"]
      end

      def !(category, user, text)
        collection.insert category: category,
                           who_id: user.id,
                           who_name: user.username,
                           who_class: user.class.to_s,
                           what: text,
                           when: Time.now.to_s
      end

      def read_all_about_it user
        
        collection.find(who_id: user.id,
                        who_class: user.class.to_s
                       ).to_a
        
      end
    end

  end
end
