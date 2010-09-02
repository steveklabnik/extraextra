require 'mongo'
include Mongo

module Extra

  class Extra

    attr_accessor :category,
                  :who_id, 
                  :who_name,
                  :who_class,
                  :what,
                  :when
    def to_s
      "#{who_name} #{what}"
    end

    class << self
      attr_accessor :db, :collection

      def source opts={}
        opts[:host] ||= "localhost"
        opts[:port] ||= 27017
        self.db = Mongo::Connection.new(opts[:host], opts[:port]).db("extraextra")
        self.collection = db["extras"]
      end

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

      def read_all_about_it user
        
        collection.find(who_id: user.id,
                        who_class: user.class.to_s
                       ).collect{|args| Extra.new args }
        
      end
    end

  end
end
