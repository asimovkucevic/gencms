class ApiController < ApplicationController

#	before_filter :authenticate_user!, :except => [:show, :index]

  def index
	user = User.find(params[:id].to_i)

	role = Role.find_or_create_by_name('productAdmin', :created_by => params[:id].to_i)
	user.roles << role

#		redirect_to :action => "/admin/users/" + params[:id].to_s + "/roles"
#		redirect_to :action => "/admin/users/" + params[:id].to_s + "/roles"
   #  response.status = 200
  	# render :json => user
  end
end
