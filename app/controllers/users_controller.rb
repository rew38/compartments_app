class UsersController < ApplicationController
  before_filter :check_session, :only=> [:index]


  def index
    @users = User.all
    @user = User.find(session[:user_id])
  end

 def new
   @user = User.new
 end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def check_session
    !session[:user_id].nil?
  end


end
