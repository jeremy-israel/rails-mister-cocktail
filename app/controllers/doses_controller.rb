class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    ingredient_id = params[:dose][:ingredient_id]
    @ingredient = Ingredient.find(ingredient_id) if ingredient_id != ""
    @dose = Dose.new(description: params[:dose]["description"], cocktail: @cocktail, ingredient: @ingredient)

    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    Dose.find(params[:id]).destroy!
    redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
  end
end
