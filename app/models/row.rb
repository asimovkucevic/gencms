class Row < ActiveRecord::Base
  belongs_to :column	
  attr_accessible :column_id, :row_data, :table_id

  	validates :row_data, :presence => true, :if => :is_field_required?
  	validates_numericality_of :row_data, :only_integer => true, :if => :is_field_integer?
    validates :row_data, :presence => true, :if => :is_field_boolean?  #,  :in => ["true", "false"]

  before_save :if_field_is_boolean


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

  def is_field_integer?
  	if column.column_type_id == 2
  		return true
  	else
  		return false
  	end
  end

  def is_field_boolean?
  	if column.column_type_id == 3
      if (row_data[:something] == true) || (row_data[:something] == false)
  		  return true
      else
        return false
      end
  	else
  		return false
  	end
  end

  def if_field_is_boolean
    if column.column_type_id ==3
      self.row_data = row_data[:something].to_s
    end
  end

end
