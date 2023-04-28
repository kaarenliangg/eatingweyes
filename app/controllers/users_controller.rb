class UsersController < ApplicationController
  before_action :fetch_user

  # show the users profile with all recipes
  def show
    @user = @current_user
    @recipes = Recipe.all
  end

  # new user sign up
  def new
      @user = User.new
  end

  def create
      @user = User.new user_params 
      if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
      else
        render :new
      end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
