class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show edit update]

  def index
    @cocktails = Cocktail.all
  end

  def search
    if params[:query].present?
      @raw_query = params[:query]
      query = "%#{@raw_query}%"
      @cocktails = []
      Cocktail.joins(:ingredients).where('cocktails.name ILIKE ? OR ingredients.name ILIKE ?', query.to_s, query.to_s).each do |cocktail|
        @cocktails << cocktail unless @cocktails.include?(cocktail)
      end
    else
      @cocktails = Cocktail.all
    end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :pic_url)
  end
end
