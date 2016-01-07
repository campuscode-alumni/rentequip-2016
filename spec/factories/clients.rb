FactoryGirl.define do
  factory :client do
    company_name 'Campus Code'
    cnpj '26.286.134/0001-04'
    address 'Alameda Santos'
    address_number '1293'
    aditional_address_detail 'conj 73'
    zipcode '12345-789'
    neighborhood 'Cerqueira Cesar'
    city 'São Paulo'
    state 'SP'
    contact_name 'Gustavo'
    phone '555-555'
    email 'g@code.com'
  end
end
