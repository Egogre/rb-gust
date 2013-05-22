require "gust/version"

module Gust
  workbook_filepath = "/Users/nathan/gems/gust2/basic_objects.xls"

  require 'spreadsheet'
  require 'pry'

  ### STRUCTURE
  @object_regions = []
  @inside = false

  def determine_object_structure
    start_index = 0
    header_row.each_with_index do |cell, i|
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
    present?(header_row[i]) && not(present?(header_row[i+1]))
  end

  ### WORKSHEET PARSER

  def parser_initialize
    puts 'in initialize'
    @title_row_index = @_ws.dimensions.first
    @header_row_index = @title_row_index + 1
    @object_start_row_index = @title_row_index + 2
  end

  def title_row
    @_ws.row(@title_row_index)
  end

  def header_row
    @_ws.row(@header_row_index)
  end

  ### SCRIPT

  def define_object_titles
    @object_regions.each do |r|
      @titles << title_row[r.first]
    end
  end

  def define_headers
    @object_regions.each do |r|
      titles = header_row[r[0]..r[1]]
      @headers << titles
    end
  end

  def collect_objects
    @_ws.each(@object_start_row_index) do |object_row|
    #@_ws.each(7) do |object_row|
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
      @object_groups[group_name] = group_objects i
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

  _wb = Spreadsheet.open(workbook_filepath)

  _wb.worksheets.each do |_ws|
    puts 'starting worksheet loop'
    @_ws = _ws
    parser_initialize
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

  ### OUTPUT

  puts "OBJECTS\n#{@objects.inspect}"
  puts "OBJECT GROUPS\n#{@object_groups.inspect}"
end
