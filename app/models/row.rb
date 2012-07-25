class Row < ActiveRecord::Base
	belongs_to :column	
  attr_accessible :column_id, :row_data, :table_id

  validates :row_data, :presence => true, :if => :is_field_required?

  def is_field_required?
  	unless column.required_field.blank?
	  	if (column.required_field.to_s == "true") 
			return true
		end
		return false
	else
		return false
	end
  end
end
