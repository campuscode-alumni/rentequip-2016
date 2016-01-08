require 'rails_helper'

feature 'Show contract' do
  scenario 'successfully' do
    client = create(:client)

    tool = Tool.create(name: 'Furadeira Blackdecker',
                       description: 'Furadeira de alta rotação',
                       serial_number: 'SEA007',
                       tools_group: 'Furadeiras',
                       status: 'Ativo')

    contract = Contract.create(client: client,
                               tools: [tool],
                               term: 15,
                               initial_date: Time.zone.now,
                               deadline: 15.days.from_now,
                               total_price: 30.00,
                               delivery_address: 'Alameda Santos, 1293',
                               responsable: 'Alan')

    visit contract_path contract

    expect(page).to have_content client.company_name
    expect(page).to have_content tool.name
    expect(page).to have_content 15
    expect(page).to have_content contract.initial_date
    expect(page).to have_content contract.deadline
    expect(page).to have_content 30.00
    expect(page).to have_content 'Alameda Santos, 1293'
    expect(page).to have_content 'Alan'
  end
end
