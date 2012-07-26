class RowsController < ApplicationController
  load_and_authorize_resource
  # before_filter :check_permissions, :only => [:new, :create, :cancel] # => :new, :create, 
  skip_before_filter :require_no_authentication

  # def check_permissions
  #   @row = Row.new
  #   authorize!  :create, @row # resource
  # end
  def index
    @tables = Table.all
  end

  def show
    @tables = Table.where([" id = ? ", params[:tid].to_i])
    @columns = Column.where([" table_id = ? ", params[:tid].to_i])
    @rows = Row.where([" table_id = ? ",  params[:tid].to_i])
  end

  def new
    @row = Row.new 
    @table_id = params[:tid].to_i
    @tables = Table.where([" id = ? ", params[:tid].to_i])
    @columns = Column.where([" table_id = ? ", params[:tid].to_i])
    @rows = Row.where([" table_id = ? ",  params[:tid].to_i])    
  end

  def create
    array_counter = Array.new(params[:column_count].to_i){|i| Date.current.year-i}
    new_row = Array.new(params[:column_count].to_i)
    error_messages = Array.new(params[:column_count].to_i)  

    flag = false
    error_message = ""
    array_counter.each_with_index do |a, index|
      new_row[index] = Row.new
      new_row[index].table_id = params[:table_id].to_i
      new_row[index].column_id = params["column_id" + index.to_s].to_i
      new_row[index].row_data = params["name" + index.to_s]      
# => Is Integer
      column = Column.where([" id = ? ", params["column_id" + index.to_s].to_i]).first            
      unless params["name" + index.to_s].blank?
        if column.column_type_id == 2
          if (new_row[index].row_data.is_a? Integer)
            flag = false
          else
            flag = true            
            error_message += column.column_name + " must be an Integer. "
          end
        end
      end
# => Is Float
    unless params["name" + index.to_s].blank?
      if column.column_type_id == 4
#        if (new_row[index].row_data.is_a? Integer)
        is_float = true if Float(new_row[index].row_data) rescue false
        if is_float
          flag = false
        else
          flag = true            
          error_message += column.column_name + " must be a Float. "
        end
      end
    end      
# => Is Empty field
      if params["name" + index.to_s].blank?
        if column.required_field == true
          flag = true
          error_message += column.column_name + " is required field. "
        end
      end
    end

   unless flag
      array_counter.each_with_index do |a, index|
        new_row[index].save      
      end
      redirect_to rows_path, :notice => "Successfully saved." 
   else
      redirect_to rows_path, :notice => error_message
   end
  end

  def edit
  end

  def update
  end



end
