class Price < ActiveRecord::Base
  belongs_to :tools_group

  validates :term, inclusion: { in: Term::TERMS.values,
                                    message: '%{value} não é um valor válido' }
end
