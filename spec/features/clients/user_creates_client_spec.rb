require 'rails_helper'

feature 'User creates a new client' do
  scenario 'sucessfully' do
    client = build(:client)

    visit new_client_path

    fill_in 'client[company_name]',             with: client.company_name
    fill_in 'client[cnpj]',                     with: client.cnpj
    fill_in 'client[contact_name]',             with: client.contact_name
    fill_in 'client[phone]',                    with: client.phone
    fill_in 'client[email]',                    with: client.email
    fill_in 'client[address]',                  with: client.address
    fill_in 'client[address_number]',           with: client.address_number
    fill_in 'client[aditional_address_detail]',
            with: client.aditional_address_detail
    fill_in 'client[zipcode]',                  with: client.zipcode
    fill_in 'client[neighborhood]',             with: client.neighborhood
    fill_in 'client[city]',                     with: client.city
    fill_in 'client[state]',                    with: client.state

    click_on 'Criar Cliente'
  end

  scenario 'invalid data' do
    visit new_client_path

    click_on 'Criar Cliente'

    ['Razão Social', 'CNPJ', 'Nome do contato', 'Telefone', 'E-mail',
     'Logradouro', 'Número', 'Complemento',
     'CEP', 'Bairro', 'Cidade', 'Estado'].each do |field|
      expect(page).to have_content "#{field}can\'t be blank"
    end
  end
end
