class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :update]

  def index
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.create(set_cocktail_params)
    if @cocktail.persisted?
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def update
    @cocktail.update(set_cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def show
    @dose = Dose.new
  end

  private

  def set_cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
