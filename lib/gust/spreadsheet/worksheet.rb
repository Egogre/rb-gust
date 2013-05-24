module Gust::Spreadsheet
  class Worksheet
    attr_reader :worksheet
    attr_reader :title_row_index, :header_row_index, :object_row_index

    def initialize worksheet
      @worksheet = worksheet
      @title_row_index = @worksheet.dimensions.first
      @header_row_index = @title_row_index + 1
      @object_row_index = @title_row_index + 2
    end

    def title_row
      @worksheet.row(title_row_index)
    end

    def header_row
      @worksheet.row(header_row_index)
    end

    def object_rows
      rows = []
      @worksheet.each(object_row_index) do |row|
        rows << row
      end
      rows
    end

    private

  end
end
