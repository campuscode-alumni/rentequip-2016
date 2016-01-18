require 'rails_helper'

feature 'Test contract model methods' do
  scenario 'successfully' do
    client = create(:client)

    tool = create(:tool)
    tool_2 = create(:tool, name: 'Britadeira DeWalt',
                           description: 'Britadeira Elétrica',
                           serial_number: 'DWT897',
                           tools_group: 'Britadeiras')
    contract = build(:contract)
    contract.tools << tool
    contract.tools << tool_2
    contract.save

    visit root_path

    expect(page).to have_content client.company_name
    expect(page).to have_content 'Furadeira Blackdecker, Britadeira DeWalt'
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
  end
end
