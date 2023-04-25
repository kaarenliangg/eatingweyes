class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
  recipe = Recipe.create recipe_params
  category = Category.find params[:category_id]
  recipe.category_id << category.id
  redirect_to recipes_path
end

  def edit
    @recipe = Recipe.find params[:id]
    @categories = @recipe.categories
  end

  def update
    recipe = Recipe.find params[:id]
    recipe.update recipe_params
    redirect_to recipe
  end

  def show
    @recipe = Recipe.find params[:id]
    @categories = @recipe.categories
    
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :servings, :preptime, :cooktime, :ingredients, :instructions, :image, :video, category_ids: [])
    end
  end
  
