
require 'spreadsheet'

require 'rb-gust/version'
require 'rb-gust/spreadsheet'
require 'rb-gust/loader'
require 'rb-gust/database'
require 'rb-gust/record'

module Gust

  def self.workbook_filepath
    @@workbook_filepath
  end

  def self.load workbook_filepath
    @@workbook_filepath = workbook_filepath
    Gust::Loader.load(workbook_filepath)
  end

end
