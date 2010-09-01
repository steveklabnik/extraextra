require 'candy'

module Extra
  class Extra
    include Candy::Piece

    def self.source opts={}
      opts[:host] ||= "localhost"
      Candy.host = opts[:host]
      opts[:port] ||= 27017
      Candy.port = opts[:port]
    end

    def self.!(category, user, text)
      extra = Extra.new
      extra.category = category
      extra.who_id = user.id
      extra.who_name = user.username
      extra.who_class = user.class
      extra.what = text
      extra.when = Time.now
    end

  end
end
