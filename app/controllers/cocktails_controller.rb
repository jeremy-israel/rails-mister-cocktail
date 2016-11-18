class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.create(name: params[:cocktail]["name"])
    if @cocktail.persisted?
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end
end
