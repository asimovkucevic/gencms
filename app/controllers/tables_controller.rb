class TablesController < ApplicationController #< Devise::RegistrationsController
	load_and_authorize_resource
  # before_filter :check_permissions, :only => [:new, :create, :cancel]	# => :new, :create, 
  # skip_before_filter :require_no_authentication

  # def check_permissions
  # 	@table = Table.new
  #   authorize! 	:create, @table # resource
  # end
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
