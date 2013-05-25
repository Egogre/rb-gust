require 'spec_helper'

describe Gust do
  it "is already loaded" do
    require('rb-gust').should be_false
  end

  it "should have objects" do
    path = File.join(File.dirname(__FILE__), 'workbooks','basic_objects.xls')
    o = Gust.load(path)
    o.should be_a(Hash)
  end
end
