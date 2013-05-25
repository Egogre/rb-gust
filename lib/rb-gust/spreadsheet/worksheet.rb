module Gust::Spreadsheet
  class Worksheet
    attr_reader :worksheet
    attr_reader :title_row_index, :header_row_index, :object_row_index
    attr_reader :object_regions
    attr_reader :titles, :headers, :objects

    def initialize worksheet
      @worksheet = worksheet
      @title_row_index = @worksheet.dimensions.first
      @header_row_index = @title_row_index + 1
      @object_row_index = @title_row_index + 2
      @object_regions = Gust::Spreadsheet::Structure.new(header_row).object_regions
      @titles = []
      @headers = []
      define_object_titles(title_row)
      define_headers(header_row)
      define_objects(object_rows)
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

    def define_object_titles title_row
      object_regions.each do |r|
        @titles << title_row[r.first]
      end
    end

    def define_headers header_row
      object_regions.each do |r|
        object_headers = header_row[r[0]..r[1]]
        @headers << object_headers
      end
    end

    def define_objects object_rows
      @objects = []
      object_rows.each do |object_row|
        object_regions.each_with_index do |r,i|
          @objects << []
          object = object_row[r[0]..r[1]]
          @objects[i] << object
        end
      end
    end

  end
end
