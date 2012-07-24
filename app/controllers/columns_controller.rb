class ColumnsController < ApplicationController
  before_filter :check_permissions, :only => [:new, :create, :cancel]   # => :new, :create, 
  skip_before_filter :require_no_authentication

  def check_permissions
    @column = Column.new
    authorize!  :create, @column # resource
#   load_and_authorize_resource      
  end



	def index
		@columns = Column.all
	end

	def new    
    	@array_counter = Array.new(2, Hash.new)    	
    	@array_counter[0] = 1
    	@array_counter[1] = 2
    	@array_counter[2] = 3
    	@array_counter[3] = 4
    	@array_counter[4] = 5
    	@array_counter[5] = 6
    	@array_counter[6] = 7
    	@array_counter[7] = 8
    	@array_counter[8] = 9
    	@array_counter[9] = 10

  #   	@column_name = Array.new(2, Hash.new)    	
  #   	@column_type_id = Array.new(2, Hash.new)    	    	

		# @column_name[0] = "column_name1"
		# @column_name[1] = "column_name2"
		# @column_type_id[0] = "column_type_id1"
		# @column_type_id[1] = "column_type_id2"		

		@column_type = ColumnType.all
		@column = Column.new
	end	

	def create
    	array_counter = Array.new(2, Hash.new)    	
    	array_counter[0] = 1
    	array_counter[1] = 2
    	array_counter[2] = 3
    	array_counter[3] = 4
    	array_counter[4] = 5	
    	array_counter[5] = 6
    	array_counter[6] = 7
    	array_counter[7] = 8
    	array_counter[8] = 9
    	array_counter[9] = 10	


		array_counter.each_with_index do |element, index|
			Column.save_columns(params["table_id"], params["column_name" + index.to_s], params["column_type_id" + index.to_s], params["required_field" + index.to_s])
		end
		redirect_to columns_path
	end

	def edit
	end

	def update
	end	
end
