class CompartmentsController < ApplicationController


  def new
    @user = User.find(session[:user_id])
    @compartment = Compartment.new
  end

  def show
    @compartment = Compartment.find(params[:id])
  end

  def create
    @compartment = Compartment.new(compartment_params)
    if @compartment.save
      redirect_to("/users/#{params[:user_id]}/projects/#{@compartment.project_id}")
    else
      render :new
    end
  end

  private

  def compartment_params
    params.require(:compartment).permit(:project_id, :title, :text_field)
  end

end
