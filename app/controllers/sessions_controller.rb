class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password]) && user.is_admin?
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end
  
end
