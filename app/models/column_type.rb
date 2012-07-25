class ColumnType < ActiveRecord::Base

	has_one :column
  attr_accessible :description, :name
end
