class TablesController < ApplicationController

	def index
		@tables = Table.all
	end

	def new
		@table = Table.new
	end	

	def create
		table = Table.new(params[:table])
		if table.save
			session[:table_id] = table.id
		end
		redirect_to  new_column_path
	end

	def edit
	end

	def update
	end

end
