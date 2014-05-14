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
      redirect_to(@compartment)
    else
      render :new
    end
  end

  private

  def compartment_params
    params.require(:compartment).permit(:project_id, :parent_id,:title, :text_field)
  end

end
