require 'spec_helper'

describe Gust::Spreadsheet::Worksheet do
  before :each do
    path = "/Users/nathan/gems/gust2/spec/workbooks/basic_objects.xls"
    _s = Spreadsheet.open(path)
    _ws = _s.worksheet('basic_objects')
    @ws = Gust::Spreadsheet::Worksheet.new(_ws)
  end

  it "handles all interactions with the Spreadsheet gem Worksheets" do
    @ws.worksheet.should be_a(::Spreadsheet::Excel::Worksheet)
  end

  it "knows where the title row is" do
    @ws.title_row_index.should be(5)
  end

  it "knows the spreadsheet titles" do
    pending
    @ws.titles.should include('Vehicles')
  end
end
