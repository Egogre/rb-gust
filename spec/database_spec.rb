require 'spec_helper'

describe Gust::Database do
  before do
    @path = File.join(File.dirname(__FILE__), 'workbooks','basic_objects.xls')
  end

  before :each do
    @database = Gust.load(@path)
  end
  attr_accessor :database

  it "should be a Gust database" do
    # Sanity Check => making sure that we're loading a database up above
    database.should be_a(Gust::Database)
  end

  it "should yield table objects" do
    database.vehicles.should eq(
      [
        {:name=>"sedan", :wheels=>4.0, :color=>"blue"},
        {:name=>"sports car", :wheels=>4.0, :color=>"red"},
        {:name=>"moving truck", :wheels=>6.0, :color=>"white"},
      ]
    )
  end

  it "should have table name accessors" do
    database.races.should_not be_nil
    database.should respond_to(:vehicles, :fruits, :cities, :races)
  end

  it "should act like a hash" do
    database.should respond_to(:[], :[]=, :keys, :values)
  end

  it "should give a list of tables" do
    database.tables.should include(:vehicles)
  end

end
