class Contract < ActiveRecord::Base
  has_and_belongs_to_many :tools
  belongs_to :client
  validates :client, :tools, :term, :initial_date, :deadline,
            :delivery_address, :responsable, presence: true

  before_save :calculate_total_price
  before_validation :set_deadline, :set_contract_number

  validates :term, inclusion: { in: Term::TERMS.values,
                                message: '%{value} não é um valor válido' }

  def print_tools
    tools.map(&:name).join(', ')
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  private

  def calculate_total_price
    total = 0
    tools.each {|tool| total += tool.price(self.deadline)}
    self.total_price = total;
  end

  def set_deadline
    self.deadline = initial_date + term.days if term
  end

  def set_contract_number
    this_year = Time.new.at_beginning_of_year.in_time_zone
    total = Contract.where(['created_at > ?', this_year]).count + 1
    number = "#{Time.zone.now.year}#{format('%06d', total)}"
    self.contract_number = number.to_i
  end
end
