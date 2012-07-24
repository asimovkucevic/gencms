class Row < ActiveRecord::Base
	belongs_to :column	
  attr_accessible :column_id, :row_data, :table_id

  validates :row_data, :presence => true, :if => :is_field_required?

  def is_field_required?
  	if column.required_field.to_s == "true"
		return true
	end
  end
end

#  	column_test = Column.where([" id = ? ", column_id.to_i]).first
#column_test.required_field #== 't'  # => unless column_test.blank?