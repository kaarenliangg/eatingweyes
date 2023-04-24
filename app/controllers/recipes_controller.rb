class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    
  end

  def new
  end

  def create
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
  end

  def show
    @recipe = Recipe.find params[:id]
    @categories = @recipe.categories
  end

  def destroy
  end
  
end
