class Tool < ActiveRecord::Base
  has_and_belongs_to_many :contracts
  belongs_to :tools_group
end
