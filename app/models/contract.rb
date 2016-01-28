class Contract < ActiveRecord::Base
  has_and_belongs_to_many :tools
  has_one :delivery_receipt
  has_one :devolution_receipt
  belongs_to :client
  validates :client, :tools, :term, :initial_date, :deadline, :total_price,
            :delivery_address, :responsable, presence: true

  before_validation :set_deadline

  validates :term, inclusion: { in: Term::TERMS.values,
                                message: '%{value} não é um valor válido' }

  def print_tools
    tools.map(&:name).join(', ')
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def delivery_receipt?
    delivery_receipt.present?
  end

  def devolution_receipt?
    devolution_receipt.present? && devolution_receipt.persisted?
  end

  def can_issue_devolution_receipt?
    delivery_receipt? && !devolution_receipt?
  end

  private

  def set_deadline
    self.deadline = initial_date + term.days if term
  end
end
