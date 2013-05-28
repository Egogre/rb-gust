require 'spec_helper'

describe Gust::Spreadsheet::Loader do
  before do
    @path = File.join(File.expand_path('..', File.dirname(__FILE__)), 'workbooks','basic_objects.xls')
  end

  let(:loader) { Gust::Spreadsheet::Loader }

  it "loads" do
    loader.load(@path).should_not be_nil
  end

  it "loads more than one worksheet into objects" do
    objects = loader.load(@path)
    objects.keys.should include(:vehicles, :races)
  end

end
