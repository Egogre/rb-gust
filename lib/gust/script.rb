
module Gust
  class Script
    attr_reader :objects, :object_groups
    def initialize
      ### STRUCTURE
      @object_regions = []
      @inside = false
    end

    def determine_object_structure
      start_index = 0
      @ws.header_row.each_with_index do |cell, i|
        if not(inside) && present?(cell)
          start_index = i
          @inside = true
        elsif inside && last_object_heading?(i)
          @object_regions << [start_index, i]
          @inside = false
        end
      end
    end

    def inside
      @inside
    end

    def present? cell
      cell && cell.length > 0
    end

    def last_object_heading? i
      present?(@ws.header_row[i]) && not(present?(@ws.header_row[i+1]))
    end

    ### SCRIPT

    def define_object_titles
      @object_regions.each do |r|
        @titles << @ws.title_row[r.first]
      end
    end

    def define_headers
      @object_regions.each do |r|
        titles = @ws.header_row[r[0]..r[1]]
        @headers << titles
      end
    end

    def collect_objects
      @ws.object_rows.each do |object_row|
        @object_regions.each_with_index do |r,i|
          object = object_row[r[0]..r[1]]
          @objects[i] << object
        end
      end
    end

    require 'active_support/inflector'
    def build_object_groups
      @object_groups = {}
      @titles.each_with_index do |title,i|
        group_name = ActiveSupport::Inflector.tableize(title).to_sym
        @object_groups[group_name] = group_objects(i)
      end
    end

    def group_objects object_group_index
      index = object_group_index
      headers = @headers[index]
      object_data = @objects[index]
      group = []
      object_data.each do |object|
        group << hashify_object(headers, object)
      end
      group
    end

    def hashify_object(headers, object)
      hash = {}
      headers.each_with_index do |header, i|
        hash[header.to_sym] = object[i]
      end
      hash
    end

    def script
      _wb = ::Spreadsheet.open(Gust.workbook_filepath)

      _wb.worksheets.each do |_ws|
        @ws = Gust::Spreadsheet::Worksheet.new(_ws)
        determine_object_structure
        @titles = []
        define_object_titles
        @headers = []
        define_headers
        @objects = []
        @object_regions.length.times { @objects << [] }
        collect_objects
        build_object_groups
      end

      @object_groups
    end
  end
end
