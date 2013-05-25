module Gust
  class Script
    attr_reader :objects, :object_groups

    require 'active_support/inflector'
    def build_object_groups
      @object_groups = {}
      @titles.each_with_index do |title,i|
        group_name = ActiveSupport::Inflector.tableize(title).to_sym
        @object_groups[group_name] = group_objects(@headers[i], @objects[i])
      end
    end

    def group_objects headers, object_data
      group = []
      object_data.each do |object_attributes|
        next if object_attributes.compact.empty?
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
