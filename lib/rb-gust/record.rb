module Gust
  class Record
    attr_accessor :hash

    def initialize hash
      @hash = hash
    end

    def to_hash
      hash
    end

    def == other
      return true if hash == other
      super
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
