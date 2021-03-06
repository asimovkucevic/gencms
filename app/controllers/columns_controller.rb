class ColumnsController < ApplicationController
    load_and_authorize_resource    
#  before_filter :check_permissions, :only => [:new, :create, :cancel]   # => :new, :create, 
  skip_before_filter :require_no_authentication

  # def check_permissions
  #   @column = Column.new
  #   authorize!  :create, @column # resource
  # end
	def index
		@columns = Column.all
	end

	def new    
    	@array_counter = Array.new(10){|i| Date.current.year-i}

		@column_type = ColumnType.all
		@column = Column.new
	end	

	def create
    	array_counter = Array.new(10){|i| Date.current.year-i}      
    	counter = Array.new(10){|i| false}
    	flag = false
		array_counter.each_with_index do |element, index|			 			
    		counter[index] = Column.save_columns(params["table_id"], params["column_name" + index.to_s], params["column_type_id" + index.to_s], params["required_field" + index.to_s])			
		end

		counter.each_with_index do |element, index|
			if counter[index] 
				flag = true
				break
			end
		end

		unless flag
			redirect_to new_column_path, :notice => "You must define at least one column."
		else
			redirect_to rows_path
		end
	end

	def edit
	end

	def update
	end	
end
