require 'spec_helper'

describe Gust do
  it "is already loaded" do
    require('gust').should be_false
  end
end
