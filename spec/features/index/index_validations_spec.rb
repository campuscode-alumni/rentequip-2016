require 'rails_helper'

Capybara.exact = true

feature 'List Contracts at index' do
  scenario 'successfully' do
    contract = build(:contract)
    tools = create_list(:tool, 3)
    contract.tools << tools
    contract.save

    visit root_path

    expect(page).to have_content 'Emitir Contrato'
    expect(page).to have_content 'Equipamentos'
    expect(page).to have_content 'Clientes'

    within('#contratos') do
      expect(page).to have_content 'Furadeira'
      expect(page).to have_content contract.format_date(contract.deadline)
      expect(page).to have_content '3'
      expect(page).to have_content 'R$ 3.000,00'
      expect(page).to have_content '2016001'
    end
  end
end
