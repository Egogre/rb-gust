require 'spec_helper'

describe Gust do
  before do
    @path = File.join(File.dirname(__FILE__), 'workbooks','basic_objects.xls')
  end

  before :each do
    @objects = Gust.load(@path)
  end
  attr_accessor :objects

  it "should have vehicles" do
    objects.vehicles.should eq(
      [
        {:name=>"sedan", :wheels=>4.0, :color=>"blue"},
        {:name=>"sports car", :wheels=>4.0, :color=>"red"},
        {:name=>"moving truck", :wheels=>6.0, :color=>"white"},
      ]
    )
  end

  it "should have objects" do
    objects.length.should be >=(0)
  end

  it "should not contain any empty objects" do
    objects.each do |object_title, object_group|
      object_group.none? do |object|
        object.values.compact.empty?
      end.should be_true
    end
  end

  it "should have object group accessors" do
    objects.races.should_not be_nil
    objects.should respond_to(:vehicles, :fruits, :cities, :races)
  end
end
