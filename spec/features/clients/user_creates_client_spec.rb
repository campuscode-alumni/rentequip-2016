require 'rails_helper'

feature 'User creates a new client' do
  scenario 'sucessfully' do
    client = build(:client)

    visit new_client_path

    fill_in 'client[company_name]',             with: client.company_name
    fill_in 'client[fantasy_name]',             with: client.fantasy_name
    fill_in 'client[cnpj]',                     with: client.cnpj
    fill_in 'client[contact_name]',             with: client.contact_name
    fill_in 'client[phone]',                    with: client.phone
    fill_in 'client[email]',                    with: client.email
    fill_in 'client[address]',                  with: client.address
    fill_in 'client[address_number]',           with: client.address_number
    fill_in 'client[zipcode]',                  with: client.zipcode
    fill_in 'client[neighborhood]',             with: client.neighborhood
    fill_in 'client[city]',                     with: client.city
    select 'São Paulo', from: 'client[state]'

    click_on 'Criar Cliente'

    expect(page).to have_content(client.company_name)
    expect(page).to have_content(client.fantasy_name)
    expect(page).to have_content(client.cnpj)
    expect(page).to have_content(client.contact_name)
    expect(page).to have_content(client.phone)
    expect(page).to have_content(client.email)
    expect(page).to have_content(client.address)
    expect(page).to have_content(client.address_number)
    expect(page).to have_content(client.zipcode)
    expect(page).to have_content(client.neighborhood)
    expect(page).to have_content(client.city)
    within('.details') do
      expect(page).to have_content(client.state)
    end
  end

  scenario 'invalid data' do
    visit new_client_path

    click_on 'Criar Cliente'

    %w(company_name fantasy_name cnpj contact_name phone
       email address address_number
       zipcode neighborhood city state).each do |field|
      within(".client_#{field}") do
        expect(page).to have_content "can\'t be blank"
      end
    end
  end
end
