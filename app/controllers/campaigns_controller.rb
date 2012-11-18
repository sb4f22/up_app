class CampaignsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy,]
  before_filter :admin_user, only: [:destroy]


  def new
     @campaign = current_user.campaigns.build if signed_in?
  end

  def create
  @campaign = current_user.campaigns.build(params[:campaign])
    if @campaign.save
      @user = campaign.user
      flash[:success] = "Campaign Created! Please enter your gift info below:"
      redirect_to 'show'
    else 
      render 'new'
    end
  end

   def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      flash[:success] = "Campaign updated"
      redirect_to @campaign
    else
      render 'edit'
    end
  end

  def destroy
  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
    @user = @campaign.user
    @gifts = @user.gifts.paginate(page: params[:page])
  end

  def index
    @campaigns = Campaign.paginate(page: params[:page])
    end

  def support
    @campaign = Campaign.find_by_id(params[:id])
  end

   private
  
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @campaign = Campaign.find_by_id(params[:id])
      @user = @campaign.user
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end