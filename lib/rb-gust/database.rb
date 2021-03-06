module Gust
  class Database
    def initialize hash
      @hash = hash
      convert_object_hashes_to_records
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

  private

    def convert_object_hashes_to_records
      @hash.each do |table_name, objects|
        objects.each_with_index do |object_hash, i|
          @hash[table_name][i] = Gust::Record.new(object_hash)
        end
      end
    end

  end
end
