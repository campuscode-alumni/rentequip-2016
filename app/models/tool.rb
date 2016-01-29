class Tool < ActiveRecord::Base
  has_and_belongs_to_many :contracts
  belongs_to :tools_group

  delegate :price_by_term, to: :tools_group
end
