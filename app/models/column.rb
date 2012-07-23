class Column < ActiveRecord::Base

	belongs_to :table
	has_one :column_type

  attr_accessible :column_name, :column_type_id, :table_id

#  validates_presence_of :table_name	# => , :on => :create    
end
