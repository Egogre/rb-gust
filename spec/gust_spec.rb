require 'spec_helper'

describe Gust do
  it "is already loaded" do
    require('gust').should be_false
  end

  it "should have objects" do
    path = "/Users/nathan/gems/gust2/spec/workbooks/basic_objects.xls"
    o = Gust.load(path)
    o.should be_a(Hash)
  end
end