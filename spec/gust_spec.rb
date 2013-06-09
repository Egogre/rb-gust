require 'spec_helper'

describe Gust do
  before do
    @path = File.join(File.dirname(__FILE__), 'workbooks','basic_objects.xls')
  end

  before :each do
    @database = Gust.load(@path)
  end
  attr_accessor :database

  it "should have objects" do
    database.length.should be >=(0)
  end

  it "should not contain any empty objects" do
    database.each do |object_title, object_group|
      object_group.none? do |object|
        object.values.compact.empty?
      end.should be_true
    end
  end

end
