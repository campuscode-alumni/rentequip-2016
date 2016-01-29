class Price < ActiveRecord::Base
  belongs_to :tools_group

  validates :deadline, inclusion: { in: Term::TERMS.values,
                                    message: '%{value} não é um valor válido' }

  # TODO: alterar deadline para term
end
