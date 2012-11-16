class GiftsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :admin_user, only: [:destroy]

  def new
    @gift = current_user.gifts.build if signed_in?
  end

  def create
    @gift = current_user.gifts.build(params[:gift])
    if @gift.save
      flash[:success] = "Gift Added! Please Add Another or view your project page:"
    redirect_to @gift
    else 
      render 'new'
    end
  end

  def edit
    @gift = Gift.find_by_id(params[:id])
  end


  def show
    @gift = Gift.find_by_id(params[:id])
    @user = @gift.user
  end

  def destroy
  end
end