module Gust::Spreadsheet
  class Loader
    attr_reader :objects, :object_groups
    attr_reader :workbook_filepath

    def initialize workbook_filepath
      @workbook_filepath = workbook_filepath
      @_workbook = ::Spreadsheet.open(workbook_filepath)
      @object_groups = {}
    end

    require 'active_support/inflector'
    def build_object_groups
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
      _workbook.worksheets.each do |_ws|
        @ws = Gust::Spreadsheet::Worksheet.new(_ws)
        @titles = @ws.titles
        @headers = @ws.headers
        @objects = @ws.objects
        build_object_groups
      end

      @object_groups
    end

    def self.load workbook_filepath
      loader = self.new(workbook_filepath)
      loader.script
    end

  private

    # Hide any references to ::Spreadsheet objects
    def _workbook
      @_workbook
    end

  end
end
