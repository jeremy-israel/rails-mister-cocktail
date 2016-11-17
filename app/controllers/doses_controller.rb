class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.where(name: params[:dose]["ingredient"]).first
    if @ingredient == nil
      render 'new'
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.create!(description: params[:dose]["description"], cocktail: @cocktail, ingredient: @ingredient)
      redirect_to cocktail_path(@cocktail)
    end
  end

  def destroy
    Dose.find(params[:id]).destroy!
    redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
  end
end
