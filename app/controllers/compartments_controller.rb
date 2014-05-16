class CompartmentsController < ApplicationController

  def index
    @compartments = Compartment.all
    render :json => @compartments
  end

  def new
    @user = User.find(session[:user_id])
    @compartment = Compartment.new
  end

  def show
    @compartment = Compartment.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def create
    @compartment = Compartment.new(compartment_params)
    if @compartment.save
      redirect_to(@compartment)
    else
      render :new
    end
  end

  def edit
    @compartment = Compartment.find(params[:id])
  end

  def update
    @compartment = Compartment.find(params[:id])

    respond_to do |format|
      format.html do
        if @compartment.update(compartment_params)
          redirect_to @compartment
        else
          redirect_to root_path
        end
      end

      format.json do
        if @compartment.update(compartment_params)
          render :json => {message: "Success!"}
        else
          render :json => {message: "Failed!"}
        end
      end
    end
  end

  private

  def compartment_params
    params.require(:compartment).permit(:project_id, :parent_id,:title, :text_field)
  end

end
