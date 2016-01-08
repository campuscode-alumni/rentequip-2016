class Client < ActiveRecord::Base
  has_many :contracts

  validates :company_name, :cnpj, :contact_name, :phone, :email,
            :address, :address_number, :aditional_address_detail,
            :zipcode, :neighborhood, :city, :state, presence: true
end
