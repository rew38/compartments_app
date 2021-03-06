class ProjectsController < ApplicationController
  before_filter :check_session

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to("/users")
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @root_compartment = Compartment.new(project_id: @project.id)
    @user = User.find(session[:user_id])
    @json_result = @project.compartments.arrange_serializable
  end

private

  def project_params
    params.require(:project).permit(:user_id, :name)
  end

  def check_session
   !session[:user_id].nil?
  end
end
