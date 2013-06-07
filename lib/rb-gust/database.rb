module Gust
  class Database
    def initialize hash
      @hash = hash
    end

    #TODO Delegation gem?

    def respond_to? m
      (@hash.respond_to?(m) || @hash.has_key?(m)) ? true : super
    end

    def method_missing m, *args, &block
      if @hash.respond_to?(m)
        @hash.send(m, *args, &block)
      else
        if @hash.has_key?(m)
          @hash[m]
        end
      end
    end
  end
end
