require 'spec_helper'

describe Table do
  before(:each) do
    @t = FactoryGirl.build(:table)
  end

  it "can make a Table from the Factory." do
    @t.should_not be_nil
    @t.should be_kind_of(Table)
  end

  it "must have a name" do
    b = Table.new(:table_name => @t.table_name)
    b.should_not be_valid
    b.errors.include?(:table_desc).should_not be_nil
  end

  it "must have a description" do
    b = Table.new(:table_desc => @t.table_desc)
    b.should_not be_valid
    b.errors.include?(:table_name).should_not be_nil
  end
end
