class Tool < ActiveRecord::Base
  has_and_belongs_to_many :contracts
  belongs_to :tools_group

  def price(dealine)
    return tools_group.prices
  end
end
