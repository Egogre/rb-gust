
require 'spreadsheet'

require 'gust/version'
require 'gust/script'
require 'gust/spreadsheet'

module Gust

  def self.workbook_filepath
    @@workbook_filepath
  end

  def self.load workbook_filepath
    @@workbook_filepath = workbook_filepath
    Script.new.script
  end

end
