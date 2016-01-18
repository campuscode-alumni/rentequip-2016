class Client < ActiveRecord::Base
  has_many :contracts

  validates :company_name, :fantasy_name, :cnpj, :contact_name, :phone, :email,
            :address, :address_number, :zipcode, :neighborhood, :city, :state,
            presence: true
end
