class Contract < ActiveRecord::Base
  has_and_belongs_to_many :tools
  belongs_to :client
  validates :client, :tools, :term, :initial_date, :deadline, :total_price,
            :delivery_address, :responsable, presence: true

  before_validation :set_deadline

  def print_tools
    tools.map(&:name).join(', ')
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  private

  def set_deadline
    self.deadline = initial_date + term.days if term
  end
end
