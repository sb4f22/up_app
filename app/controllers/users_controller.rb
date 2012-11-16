class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy, :index]


  def new
  	#defines what the variable @user means on the new user page, aka the sign up page
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Great! Welcome to Up and Away!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
    @campaigns = @user.campaigns
    @gifts = @user.gifts
    @relationships = @user.relationships
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed!"
    redirect_to users_url
  end

  def funding?(other_user)
    relationships.find_by_funded_id(other_user.id)
  end

  def fund!(other_user)
    relationships.create!(funded_id: other_user.id)
  end

  def wepay_connect
    @user = current_user
    wepay_gateway = WepayRails::Payments::Gateway.new
    redirect_to wepay_gateway.auth_code_url(user_wepay_auth_url(@user, :only_path => false) )
end

 def wepay_auth
    @user = current_user
  if params[:code].present?
    wepay_gateway = WepayRails::Payments::Gateway.new
    access_token = wepay_gateway.get_access_token(params[:code], user_wepay_auth_url(@user, :only_path => false) )
    @user.update_attributes(:wepay_token => access_token, :wepay_id => wepay_gateway.account_id) 
      if @user.save
        flash[:success] = "You Got Your Access Token, Now Create Your Account "
      end
  else
    flash[:notice] = "Your WePay account was not connected."
    redirect_to root_path
  end
end

def create_wepay_account
    @user = current_user
    wepay_gateway = WepayRails::Payments::Gateway.new(@user.wepay_token)
    response = wepay_gateway.create_account({
      :name => "#{@user.name} on Up and Away",
      :description => "This account will collect money on behalf of this user's Up and Away Campaign.",
    })
    @user.wepay_account_id = response[:account_id]
    @user.wepay_account_uri = response[:account_uri]
    @user.save
  end

  def wepay_info
    @user = current_user
  end


  def give
     @user = User.find(params[:id])
  end



  private


  
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end




