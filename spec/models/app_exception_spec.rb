require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AppException do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    AppException.create!(@valid_attributes)
  end
end
