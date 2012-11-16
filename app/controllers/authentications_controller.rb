class AuthenticationsController < ApplicationController


def index
  @authentications = current_user.authentications if current_user
end

def create
	@user = current_user
    wepay_gateway = WepayRails::Payments::Gateway.new
    redirect_to wepay_gateway.auth_code_url( user_wepay_auth_url(@user, :only_path => false) )
end

def wepay_auth
	@user = current_user
  if params[:code].present?
    wepay_gateway = WepayRails::Payments::Gateway.new
    access_token = wepay_gateway.get_access_token(params[:code], user_wepay_auth_url(@user, :only_path => false) )
    if @user.update_attributes(:wepay_token => access_token, :wepay_id => wepay_gateway.account_id)
      flash[:success] = "Your WePay account is now connected!  You're ready to start receiving payments!"
    end
  else
    flash[:notice] = "Your WePay account was not connected."
    redirect_to root_path
  end
end

def destroy
  @authentication = current_user.authentications.find(params[:id])
  @authentication.destroy
  flash[:notice] = "Successfully destroyed authentication."
  redirect_to authentications_url
end


protected

  def auth_hash
    request.env['omniauth.auth']
  end
end