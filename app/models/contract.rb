class Contract < ActiveRecord::Base
  has_and_belongs_to_many :tools
  belongs_to :client
  validates :client, :tools, :term, :initial_date, :deadline, :total_price,
            :delivery_address, :responsable, presence: true

  def print_tools
    tools_list = ''
    tools.each do |tool|
      tools_list << tool.name
    end
    tools_list
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def set_deadline
    self.deadline = initial_date + term.days
  end
end
