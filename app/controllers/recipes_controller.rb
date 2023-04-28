class RecipesController < ApplicationController
  # show all recipes
  def index
    @recipes = Recipe.all
  end

  # create new recipes
  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new recipe_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      recipe.image = req["public_id"]
      recipe.save
    end
    
    @current_user.recipes << recipe
    redirect_to recipe
  end

  # edit recipes
  def edit
    @recipe = Recipe.find params[:id]
    @categories = @recipe.categories
  end

  # make updates to recipe
  def update
    recipe = Recipe.find params[:id]
    if params[:file].present? 
      req = Cloudinary::Uploader.upload(params[:file])
      recipe.image = req["public_id"]
      recipe.save
    end
    recipe.update recipe_params
    redirect_to recipe
  end

  # Show individual recipes
  def show
    @recipe = Recipe.find params[:id]
    @categories = @recipe.categories

  end

  # Delete recipes
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

  
