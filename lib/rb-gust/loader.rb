module Gust
  class Loader
    attr_reader :hash, :database

    def initialize workbook_filepath
      @hash = Spreadsheet::Loader.load(workbook_filepath)
      @database = Gust::Database.new(@hash)
    end

    def self.load workbook_filepath
      loader = self.new(workbook_filepath)
      loader.database
    end
  end
end
