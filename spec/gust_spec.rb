require 'spec_helper'

describe Gust do
  before do
    @path = File.join(File.dirname(__FILE__), 'workbooks','basic_objects.xls')
  end

  it "is already loaded" do
    require('rb-gust').should be_false
  end

  it "should have objects" do
    o = Gust.load(@path)
    o.should be_a(Hash)
  end

  it "should not contain any empty objects" do
    o = Gust.load(@path)
    o.each do |object_title, object_group|
      object_group.none? do |object|
        object.values.compact.empty?
      end.should be_true
    end
  end
end
