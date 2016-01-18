require 'rails_helper'

feature 'List contracts' do
  scenario 'successfully' do
    client = create(:client)
    tool = create(:tool)
    contract = build(:contract)
    contract.tools << tool
    contract.save

    visit root_path

    expect(page).to have_content client.company_name
    expect(page).to have_content tool.name
    expect(page).to have_content contract.deadline
    expect(page).to have_content 'Ver mais'

    click_on 'Ver mais'

    expect(page).to have_content client.company_name
    expect(page).to have_content tool.name
    expect(page).to have_content contract.term
    expect(page).to have_content contract.initial_date.strftime('%d/%m/%Y')
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
    expect(page).to have_content 'R$ 30,00'
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.responsable
  end
end
