
require 'spreadsheet'

require 'rb-gust/version'
require 'rb-gust/spreadsheet'

module Gust

  def self.workbook_filepath
    @@workbook_filepath
  end

  def self.load workbook_filepath
    @@workbook_filepath = workbook_filepath
    Spreadsheet::Loader.load(self.workbook_filepath)
  end

end
