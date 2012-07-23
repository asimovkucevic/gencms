class ColumnType < ActiveRecord::Base

	belongs_to :column
  attr_accessible :description, :name
end
