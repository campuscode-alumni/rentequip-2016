class Price < ActiveRecord::Base
  belongs_to :tools_group

  validates :term, inclusion: { in: Term::TERMS.values,
                                message: '%{value} não é um valor válido' }

  def self.group_price
    ids = select('max(id) as id').group('term, tools_group_id')
    all.where(id: ids).order('tools_group_id, term')
  end
end
