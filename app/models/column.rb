class Column < ActiveRecord::Base

	belongs_to :table
	belongs_to :column_type
	has_one :row
  attr_accessible :column_name, :column_type_id, :table_id

  validates_presence_of :column_name, :column_type_id, :table_id 	#, :on => :create

	def self.save_columns(table_id, column_name, column_type_id, required_field)
		unless table_id.blank? || column_name.blank? || column_type_id.blank?
			column = Column.new
			column.table_id = table_id
			column.column_name = column_name
			column.column_type_id = column_type_id
			column.required_field = required_field			
			column.save
			return true
		else 
			return false
		end
	end

end

