class ToolsGroup < ActiveRecord::Base
  has_many :tools
  has_many :prices
  validates :name, presence: true
end
