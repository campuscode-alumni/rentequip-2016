require 'rails_helper'

feature 'Show contract' do
  scenario 'successfully' do
    client = create(:client)
    tool = create(:tool)
    contract = build(:contract)
    contract.tools << tool
    contract.save

    visit contract_path contract

    expect(page).to have_content "#{client.fantasy_name} #{client.state}"
    expect(page).to have_content tool.name
    expect(page).to have_content contract.term
    expect(page).to have_content contract.initial_date.strftime('%d/%m/%Y')
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
    expect(page).to have_content 'R$ 3.000,00'
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.responsable
  end
end
