class Contract < ActiveRecord::Base
  has_and_belongs_to_many :tools
  belongs_to :client
  validates :client, :tools, :term, :initial_date, :deadline, :total_price,
            :delivery_address, :responsable, presence: true

  def set_deadline
    self.deadline = initial_date + term.days
  end
end
