require 'spec_helper'

describe Gust::Record do
  before do
    @path = File.join(File.dirname(__FILE__), 'workbooks','basic_objects.xls')
  end

  before :each do
    database = Gust.load(@path)
    @boulder = database.cities.first
    #=> {:name=>"Boulder", :state=>"CO", :favorite_fruit_id=>3.0}
  end
  attr_accessor :boulder

  it "should be a Gust record" do
    # Sanity Check => making sure that we're loading a database up above
    boulder.should be_a(Gust::Record)
  end

  it "should provide attribute accessors" do
    boulder.name.should == "Boulder"
    boulder.state.should == "CO"
    boulder.favorite_fruit_id.should == 3
  end

  it "provides access to the hash" do
    boulder.should respond_to(:to_hash, :hash)
  end

  it "looks like a hash" do
    (boulder == {:name=>"Boulder", :state=>"CO", :favorite_fruit_id=>3.0}).should be_true
  end

end
