require 'rails_helper'

feature 'User edits a client' do
  scenario 'sucessfully' do
    client = create(:client)

    visit edit_client_path client

    fill_in 'client[company_name]',   with: 'Locaweb'
    fill_in 'client[cnpj]',           with: '26.333.134/1234-04'
    fill_in 'client[address]',        with: 'rua sei la'

    click_on 'Atualizar Cliente'

    expect(page).to have_content('Locaweb')
    expect(page).to have_content('26.333.134/1234-04')
    expect(page).to have_content('rua sei la')
  end

  scenario 'invalid data' do
    client = create(:client)
    visit edit_client_path client

    fill_in 'client[company_name]',   with: ''
    fill_in 'client[cnpj]',           with: ''
    fill_in 'client[address]',        with: ''

    click_on 'Atualizar Cliente'

    ['Razão Social', 'CNPJ', 'Logradouro'].each do |field|
      expect(page).to have_content "#{field}can\'t be blank"
    end
  end
end
