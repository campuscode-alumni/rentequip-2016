require 'rails_helper'

feature 'Create a new Contract' do
  scenario 'successfully' do
    client = create(:client)

    tool = Tool.create(name: 'Furadeira Blackdecker',
                       description: 'Furadeira de alta rotação',
                       serial_number: 'SEA007',
                       tools_group: 'Furadeiras',
                       status: 'Ativo')

    visit new_contract_path

    today = Time.zone.now
    deadline = 15.days.from_now

    select client.company_name, from: 'contract[client_id]'
    select tool.name, from: 'contract[tool_ids][]'
    fill_in 'contract[term]', with: 15
    fill_in 'contract[initial_date]', with: today
    fill_in 'contract[deadline]', with: deadline
    fill_in 'contract[total_price]', with: 30.00
    fill_in 'contract[delivery_address]', with: 'Alameda Santos, 1293'
    fill_in 'contract[responsable]', with: 'Alan'

    click_on 'Emitir Contrato'

    contract = Contract.last

    expect(page).to have_content client.company_name
    expect(page).to have_content tool.name
    expect(page).to have_content contract.term
    expect(page).to have_content contract.initial_date
    expect(page).to have_content contract.deadline
    expect(page).to have_content contract.total_price
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.responsable
  end
end
