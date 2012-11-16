class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

	def wepay
	  	@user = current_user
	  	if params[:code].present?
	    	wepay_gateway = WepayRails::Payments::Gateway.new
	    	access_token = wepay_gateway.get_access_token(params[:code], 'http://localhost:3000/wepay' )
	    	@user.update_attributes(:wepay_token => access_token, :wepay_id => wepay_gateway.account_id)
	    	if @user.update_attributes(:wepay_token => access_token, :wepay_id => wepay_gateway.account_id)
      		flash[:success] = "Your WePay account is now connected!  You're ready to start receiving payments!"
  			else
    		flash[:notice] = "Your WePay account was not connected."
    		redirect_to root_path
    	end
  end
 	end


end
