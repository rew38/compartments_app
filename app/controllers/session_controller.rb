class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Thanks for loggin in!"
      if user.is_a?(User)
       redirect_to users_path
      else
        redirect_to "/"
      end
    else
      # rerender the login form
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

end
