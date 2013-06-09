module Gust
  class Database
    def initialize hash
      @hash = hash
    end

    def tables
      @hash.keys
    end

    #ActiveSupport delegation not working...
    #delegate :[], :[]=, :keys, :values, :to => :@hash

    def respond_to_missing? m, include_private
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
