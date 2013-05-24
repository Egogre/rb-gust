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

  it "knows about the title row" do
    @ws.title_row.should include('Vehicles')
  end

  it "knows about the header row" do
    @ws.header_row.should include('juicable?')
  end

  it "knows about the object rows" do
    @ws.object_rows.should have(4).object_rows
  end

end
