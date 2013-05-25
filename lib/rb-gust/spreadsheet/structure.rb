module Gust::Spreadsheet
  class Structure
    attr_reader :header_row, :object_regions, :inside

    def initialize header_row
      @header_row = header_row
      @object_regions = []
      determine_object_structure
    end

    private

    def determine_object_structure
      @inside = false
      start_index = 0
      header_row.each_with_index do |cell, i|
        if single_column_object?(i)
          @object_regions << [i,i]
        elsif first_column?(cell)
          start_index = i
          @inside = true
        elsif last_column?(i)
          @object_regions << [start_index, i]
          @inside = false
        end
      end
    end

    def single_column_object? i
      not(inside) && last_object_heading?(i)
    end

    def first_column?(cell)
      not(inside) && present?(cell)
    end

    def last_column?(i)
      inside && last_object_heading?(i)
    end

    def present? cell
      cell && cell.length > 0
    end

    def last_object_heading? i
      present?(header_row[i]) && not(present?(header_row[i+1]))
    end

  end
end
