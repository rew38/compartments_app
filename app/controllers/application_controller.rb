class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :render_layout

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def user_logged_in?
      current_user.present?
    end

    def admin_logged_in?
      current_user.present? && current_user.admin?
    end

    def render_layout
      if admin_logged_in?
        "admin"
      elsif user_logged_in?
        "user"
      else
        "application"
      end
    end

    helper_method :current_user
    helper_method :user_logged_in?
end
