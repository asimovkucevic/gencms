class ColumnType < ActiveRecord::Base

	has_one :column
#	belongs_to :column
  attr_accessible :description, :name
end
