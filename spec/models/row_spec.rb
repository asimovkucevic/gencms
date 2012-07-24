require 'spec_helper'

describe Row do
  before(:each) do
    @r = FactoryGirl.build(:row)
  end

  it "can make a Row from the Factory." do
    @r.should_not be_nil
    @r.should be_kind_of(Row)
  end

  describe "Associations" do
    it "belongs to column" do
      Row.new.should respond_to(:column)
    end
  end

end
