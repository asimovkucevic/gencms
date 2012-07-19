class AuthenticationsController < ApplicationController

# => before_filter :authenticate_user!, :except => [:some_action_without_auth]

  def index
    @authentications = current_user.authentications if current_user
#    Authentication.all
  end

  def create
# => request.env["rack.auth"]    
#    render :text => request.env["omniauth.auth"].to_yaml
    omniauth = request.env["omniauth.auth"]
#    render :json => current_user
#    current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
#    authentication = Authentication.find_by_provider_or_uid(omniauth['provider'], omniauth['uid'])
    authentication = Authentication.where([" provider = ? and uid = ? ", omniauth['provider'], omniauth['uid']]).first
    if authentication
      flash[:notice] = "Signed in successfully"      
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successfull"
      redirect_to authentications_url
    else
      user = User.new
#      user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      user.apply_omniauth(omniauth)
#      user.save(:validate => false)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session['omniauth'] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
#     Authentication.find(params[:id])
#    render :text => params[:id].to_s
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
