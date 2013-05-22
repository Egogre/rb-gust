require "gust/version"
require 'spreadsheet'
require 'gust/script'

module Gust

  def self.workbook_filepath
    @@workbook_filepath
  end

  def self.load workbook_filepath
    @@workbook_filepath = workbook_filepath
    Script.new.script
  end

end
