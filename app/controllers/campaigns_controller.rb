class CampaignsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :admin_user, only: [:destroy]


  def new
     @campaign = current_user.campaigns.build if signed_in?
  end

  def create
  @campaign = current_user.campaigns.build(params[:campaign])
    if @campaign.save
      flash[:success] = "Campaign Created! Please enter your gift info below:"
      redirect_to @campaign
    else 
      render 'new'
    end
  end

  def edit
    @campaign = Campaign.find_by_id(params[:id])

  end

  def update
  end

  def destroy
  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
    @user = @campaign.user
    @gifts = @user.gifts.paginate(page: params[:page])
  end

  def index
  end
end