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
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.save
    if @gift.save!
      flash[:success] = "Gift updated"
      redirect_to @gift
    else
      render 'edit'
    end
  end


  def show
    @gift = Gift.find_by_id(params[:id])
    @user = @gift.user
  end

  def destroy
  end



  private


  
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @gift = Gift.find_by_id(params[:id])
      @user = @gift.user
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end