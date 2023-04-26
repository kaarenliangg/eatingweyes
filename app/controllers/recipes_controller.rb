class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new recipe_params
    # recipe = Recipe.create recipe_params
    # CLOUNDINARY EDITS - checking if user has attached image uploading
    if params[:file].present? 
      req = Cloudinary::Uploader.upload(params[:file])
      recipe.image = req["public_id"]
      recipe.save
    end
    @current_user.recipes << recipe
    redirect_to recipe
  end

  def edit
    @recipe = Recipe.find params[:id]
    @categories = @recipe.categories
  end

  def update
    recipe = Recipe.find params[:id]
    # delete if it clashes
    if params[:file].present? 
      req = Cloudinary::Uploader.upload(params[:file])
      recipe.image = req["public_id"]
      recipe.save
    end
    ######
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

    def convert_video
      url = @recipe.video
      video = url.split("=").last 
    end
  end
  
