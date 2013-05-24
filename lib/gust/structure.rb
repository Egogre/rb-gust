module Gust
  class Structure
    attr_reader :header_row, :object_regions, :inside

    def initialize header_row
      @header_row = header_row
      @object_regions = []
      @inside = false
      determine_object_structure
    end

    private

    def determine_object_structure
      start_index = 0
      header_row.each_with_index do |cell, i|
        if not(inside) && last_object_heading?(i)
          # Single column object
          @object_regions << [i,i]
        elsif not(inside) && present?(cell)
          start_index = i
          @inside = true
        elsif inside && last_object_heading?(i)
          @object_regions << [start_index, i]
          @inside = false
        end
      end
    end

    def present? cell
      cell && cell.length > 0
    end

    def last_object_heading? i
      present?(header_row[i]) && not(present?(header_row[i+1]))
    end

  end
end
