require 'rails_helper'

feature 'User edits a client' do
  scenario 'sucessfully' do
    client = create(:client)

    visit edit_client_path client

    fill_in 'client[fantasy_name]',   with: client.fantasy_name
    fill_in 'client[cnpj]',           with: client.cnpj
    fill_in 'client[address]',        with: client.address

    click_on 'Atualizar Cliente'

    expect(page).to have_content(client.fantasy_name)
    expect(page).to have_content(client.cnpj)
    expect(page).to have_content(client.address)
  end

  scenario 'invalid data' do
    client = create(:client)
    visit edit_client_path client

    fill_in 'client[fantasy_name]',   with: ''
    fill_in 'client[cnpj]',           with: ''
    fill_in 'client[address]',        with: ''

    click_on 'Atualizar Cliente'
    ['Nome Fantasia', 'CNPJ', 'Logradouro'].each do |field|
      expect(page).to have_content "#{field}can\'t be blank"
    end
  end
end
