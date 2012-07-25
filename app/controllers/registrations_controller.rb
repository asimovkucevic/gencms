class RegistrationsController < Devise::RegistrationsController
#	ApplicationController
  # before_filter :check_permissions, :only => [:new, :create, :cancel]	# => :new, :create, 
  # skip_before_filter :require_no_authentication
 
  # def check_permissions
  #   authorize! :create, resource
  # end


	def create
		super
		session[:omniauth] = nil unless @user.new_record?
	end

	private

	def build_resource(*args)
		super
		if session[:omniauth]
			@user.apply_omniauth(session[:omniauth])
			@user.valid?
		end
	end			
end
