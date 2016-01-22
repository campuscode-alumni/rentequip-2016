class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def new
    @tools_group = ToolsGroup.all
    @terms = Term::TERMS
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to @price
    else
      flash[:warning] = 'Não foi possível salvar tabela de preços'
      render :new
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price).permit(:price, :deadline, :tools_group_id)
  end
end
