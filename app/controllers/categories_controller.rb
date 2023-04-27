class CategoriesController < ApplicationController
  before_action :check_for_admin, :only => [:index]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    category = Category.create category_params
    redirect_to category
  end

  def edit
    @categories = Category.find params[:id]
  end

  def update
    category = Category.find params[:id]
    category.update category_params
    redirect_to category
  end

  def show
    @category = Category.find params[:id]
    @recipes = @category.recipes
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

  
end
