require 'rails_helper'

feature 'Try to create a contract' do
  scenario 'unsuccessfully' do
    client = create(:client)

    tool = Tool.create(name: 'Furadeira Blackdecker',
                       description: 'Furadeira de alta rotação',
                       serial_number: 'SEA007',
                       tools_group: 'Furadeiras',
                       status: 'Ativo')

    visit new_contract_path

    today = Time.zone.now

    select client.company_name, from: 'contract[client_id]'
    select tool.name, from: 'contract[tool_ids][]'
    fill_in 'contract[term]', with: 15
    fill_in 'contract[initial_date]', with: today
    fill_in 'contract[total_price]', with: 30.00
    fill_in 'contract[delivery_address]', with: 'Alameda Santos, 1293'
    fill_in 'contract[responsable]', with: ''

    click_on 'Emitir Contrato'

    expect(page).to have_content 'Campo obrigatório'
  end
end
