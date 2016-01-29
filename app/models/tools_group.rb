class ToolsGroup < ActiveRecord::Base
  has_many :tools
  has_many :prices
  validates :name, presence: true

  def price_by_term(term)
    # TODO: alterar deadline para term
    prices.where(deadline: term).last || NoPrice.new
  end
end
