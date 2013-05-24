
module Gust
  class Script
    attr_reader :objects, :object_groups

    ### SCRIPT

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
        @object_regions = Gust::Spreadsheet::Structure.new(@ws.header_row).object_regions
        @titles = @ws.titles
        @headers = @ws.headers
        @objects = []
        @object_regions.length.times { @objects << [] }
        collect_objects
        build_object_groups
      end

      @object_groups
    end
  end
end
