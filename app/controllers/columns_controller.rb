class ColumnsController < ApplicationController

	def index
		@columns = Column.all
	end

	def new
    
    	@a = Array.new(2, Hash.new)

		@column_type = ColumnType.all
		@column = Column.new
	end	

	def create
		Column.create!(params[:column])		
		redirect_to columns_path
	end

	def edit
	end

	def update
	end	
end
