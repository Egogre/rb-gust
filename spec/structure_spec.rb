require 'spec_helper'

describe Gust::Structure do
  before do
    # Gust assumes that you have spacers between separate object headers
    header_row = [nil, 'headerA1', 'headerA2', nil, nil, 'headerB1', 'headerB2', 'headerB3', nil, 'headerC1']
    @structure = Gust::Structure.new(header_row)
  end

  it "knows the object regions" do
    @structure.object_regions.should == [[1,2],[5,7],[9,9]]
  end

end

