require 'candy'

module Extra
  class Extras
    include Candy::Collection
    collects :extra
  end

  class Extra
    include Candy::Piece

    class << self

      def source opts={}
        opts[:host] ||= "localhost"
        Candy.host = opts[:host]
        opts[:port] ||= 27017
        Candy.port = opts[:port]
      end

      def !(category, user, text)
        extra = Extra.new
        extra.category = category
        extra.who_id = user.id
        extra.who_name = user.username
        extra.who_class = user.class
        extra.what = text
        extra.when = Time.now
      end

      def read_all_about_it user
        Extras.new(:who_id => user.id, :who_class => user.class)
      end

    end

  end
end
