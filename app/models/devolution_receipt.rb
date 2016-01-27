class DevolutionReceipt < ActiveRecord::Base
  belongs_to :contract
  validates :employee, presence: true
end
