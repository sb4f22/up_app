class UsersController < ApplicationController
  def new
  	#defines what the variable @user means on the new user page, aka the sign up page
  	@user = User.new
  end

  def create
  	#defines what to do with the user.create method
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Great! Welcome to Up and Away!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
  end
end



