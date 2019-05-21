class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times {@recipe.ingredients.build()}
  end

  def create
    @recipe = Recipe.create(recipes_param)
    redirect_to recipe_path(@recipe)
  end

  private
  def recipes_param
    params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity])
  end
end
