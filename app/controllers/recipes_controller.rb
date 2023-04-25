class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # recipe = Recipe.create recipe_params
    # category = Category.find params[:id]
    # recipe.categories << category
    # recipe.save

    recipe = Recipe.create recipe_params
    # HOW TO ASSOCIATE THIS MIXTAPE WITH THE CURRENT USER?
    @current_user.recipes << recipe

    # # one line version of above code
    # @current.user.mixtapes.create mixtape_params
    
    redirect_to root_path # TODO: redirect somewhere better
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
  
