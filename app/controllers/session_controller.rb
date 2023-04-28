class SessionController < ApplicationController
  def new
  end

  # Sign up / create new user / session
  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to recipes_path
    else
      flash[:error] = "Invalid username or password"
      redirect_to login_path
    end
  end

  # Destroy / close session when the user logs out
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end

