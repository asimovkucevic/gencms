require 'spec_helper'

describe ColumnType do

  describe "Associations" do
    it "has one column" do
      ColumnType.new.should respond_to(:column)
    end
  end

end
