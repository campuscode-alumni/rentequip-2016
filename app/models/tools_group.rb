class ToolsGroup < ActiveRecord::Base
  has_many :tools
  validates :name, presence: true
end
