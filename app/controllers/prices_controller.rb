class PricesController < ApplicationController
  def index
    @prices = Price.group_price
  end

  def new
    @tools_group = ToolsGroup.all
    @terms = Term::TERMS
    @price = Price.new(term: params[:term], tools_group_id: params[:tool_group])
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
    strong_params = params.require(:price).permit(:price, :term, :tools_group_id)
    strong_params[:price] = strong_params[:price].gsub(/[^\d,.]/, '')
                            .gsub(/[,.]/, '.' => '', ',' => '.')
    strong_params
  end
end
