module Gust::Spreadsheet
  class Worksheet
    attr_reader :worksheet
    attr_reader :title_row_index

    def initialize worksheet
      @worksheet = worksheet
      @title_row_index = @worksheet.dimensions.first
      #@header_row_index = @title_row_index + 1
      #@object_start_row_index = @title_row_index + 2
    end

    private

    def title_row
      @worksheet.row(@title_row_index)
    end

  end
end
