
require 'spreadsheet'

require 'rb-gust/version'
require 'rb-gust/script'
require 'rb-gust/spreadsheet'

module Gust

  def self.workbook_filepath
    @@workbook_filepath
  end

  def self.load workbook_filepath
    @@workbook_filepath = workbook_filepath
    Script.new.script
  end

end
