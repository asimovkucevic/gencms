class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel, :update]
  skip_before_filter :require_no_authentication
 
  def check_permissions
    authorize! :create, resource
  end

	def new

	end

	def create

	end

	def cancel

	end

end