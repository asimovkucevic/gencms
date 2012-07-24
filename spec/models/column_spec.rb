require 'spec_helper'

describe Column do
  before(:each) do
    @c = FactoryGirl.build(:column)
  end

  it "can make a Column from the Factory." do
    @c.should_not be_nil
    @c.should be_kind_of(Column)
  end

  it "must have a table id" do
    b = Column.new(:column_name => @c.column_name, :column_type_id => @c.column_type_id)
    b.should_not be_valid
    b.errors.include?(:table_id).should_not be_nil
  end

  it "must have a name" do
    b = Column.new(:table_id => @c.table_id, :column_type_id => @c.column_type_id)
    b.should_not be_valid
    b.errors.include?(:column_name).should_not be_nil
  end

  it "must have a column type id" do
    b = Column.new(:table_id => @c.table_id, :column_name => @c.column_name)
    b.should_not be_valid
    b.errors.include?(:column_type_id).should_not be_nil
  end

  it "creates an column" do
    lambda {
      Column.create!( { :column_name => "column", :table_id => "1", :column_type_id => "1" } )
    }.should change { Column.count }.by(1)
  end

  describe "Associations" do
    it "belongs to table" do
      Column.new.should respond_to(:table)
    end

    it "belongs to column type" do
      Column.new.should respond_to(:column_type)
    end

    it "has one row" do
      Column.new.should respond_to(:row)
    end
  end

end
