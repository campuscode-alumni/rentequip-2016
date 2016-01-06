class Contract < ActiveRecord::Base
  validates :client, :equipment, :term, :initial_date, :deadline, :total_price, :delivery_address, :responsable, presence: true
end
