class Row < ActiveRecord::Base
  belongs_to :column	
  attr_accessible :column_id, :row_data, :table_id

    validate :mydate_is_date?
  	validates :row_data, :presence => true, :if => :is_field_required?
  	validates_numericality_of :row_data, :only_integer => true, :if => :is_field_integer?
    validates :row_data, :presence => true, :if => :is_field_boolean?  #,  :in => ["true", "false"]
    validates_numericality_of :row_data, :if => :is_field_float?
#    validates :row_data, :mydate_is_date? => true, :if => :is_field_datetime?



  before_save :if_field_is_boolean, :if_field_is_datetime


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

  def is_field_float?
    if column.column_type_id == 4
      return true
    else
      return false
    end
  end

  def is_field_datetime? 
    if column.column_type_id == 5
      return true
    else
      return false
    end
  end

  def mydate_is_date?
    if column.column_type_id == 5
      mydate = DateTime.new(row_data["written_on(1i)"].to_i, 
                        row_data["written_on(2i)"].to_i,
                        row_data["written_on(3i)"].to_i,
                        row_data["written_on(4i)"].to_i,
                        row_data["written_on(5i)"].to_i)

      if !mydate.is_a?(Date)        
        errors.add(:mydate, 'must be a valid date')         
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

  def if_field_is_datetime
    if column.column_type_id == 5
      self.row_data = DateTime.new(row_data["written_on(1i)"].to_i, 
                        row_data["written_on(2i)"].to_i,
                        row_data["written_on(3i)"].to_i,
                        row_data["written_on(4i)"].to_i,
                        row_data["written_on(5i)"].to_i)
    end
  end

  # def check_field_integer(column1, name)
  #   flag_message = Array.new(2)                
  #   flag_message[0] = false
  #   flag_message[1] = "test"
  #   unless name.blank?
  #     if column1.column_type_id == 2
            
  #           flag_message[0] = true if Integer(name) rescue false 
  #           flag_message[1] = column1.column_name + " must be an Integer. "
  #     end
  #   end
  #   return flag_message
  # end

      # column = Column.where([" id = ? ", params["column_id" + index.to_s].to_i]).first      
      # unless params["name" + index.to_s].blank?
      #   if column.column_type_id == 2
      #     unless params["name" + index.to_s].to_i.is_a? Integer
      #       flag = true            
      #       error_message += column.column_name + " must be an Integer. "
      #     end
      #   end
      # end


end
