class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def projectstartpage
  	@project = current_user.projects.build if signed_in?
  end
end
