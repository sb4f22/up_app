class ProjectsController < ApplicationController
  before_filter :signed_in_user, only: [ :new, :preview, :create, :destroy, :edit]


  def new
    @project = current_user.projects.build(params[:project])
    @project.project_assets.build
  end

  def preview
  end

  def index
  end

  def create
  	@project = current_user.projects.build(params[:project])
  	if @project.save
    flash[:success] = "Well done! Preview your Project Page!"
  	redirect_to root_path
    else
      redirect_to start_path
    end
  end

  def destroy
  end

  def edit
    @project = current_user.projects.find_by_id(params[:id])
    5.times { @project.project_assets.build }
  end

  def show
    @project = User.projects.find_by_id(params[:id])
  end

end