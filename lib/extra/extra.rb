require 'candy'

module Extra
  class Extra
    include Candy::Piece

    class << self
      alias_method :'!', :new
    end

    def self.source opts={}
      opts[:host] ||= "localhost"
      Candy.host = opts[:host]
      opts[:port] ||= 27017
      Candy.port = opts[:port]
    end

  end
end
