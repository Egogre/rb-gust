module Gust
  class Script
    attr_reader :objects, :object_groups

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
      object_data.each do |object_attributes|
        group << hashify_object(headers, object_attributes)
      end
      group
    end

    def hashify_object(headers, object_attributes)
      hash = {}
      headers.each_with_index do |header, i|
        hash[header.to_sym] = object_attributes[i]
      end
      hash
    end

    def script
      _wb = ::Spreadsheet.open(Gust.workbook_filepath)

      _wb.worksheets.each do |_ws|
        @ws = Gust::Spreadsheet::Worksheet.new(_ws)
        @titles = @ws.titles
        @headers = @ws.headers
        @objects = @ws.objects
        build_object_groups
      end

      @object_groups
    end
  end
end
