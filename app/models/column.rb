class Column < ActiveRecord::Base

	belongs_to :table
	has_one :column_type

  attr_accessible :column_name, :column_type_id, :table_id

  validates_presence_of :column_name 	#, :if => :required_field?	# => true 	# :on => :create    

	def self.save_columns(table_id, column_name, column_type_id, required_field)
		unless table_id.blank? || column_name.blank? || column_type_id.blank?
			column = Column.new
			column.table_id = table_id
			column.column_name = column_name
			column.column_type_id = column_type_id
			column.required_field = required_field			
			column.save
		end
	end

end

