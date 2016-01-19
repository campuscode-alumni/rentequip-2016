require 'rails_helper'

feature 'Try to create a contract' do
  scenario 'unsuccessfully' do
    client = create(:client)

    tool = Tool.create(name: 'Furadeira Black&Decker',
                       description: 'Furadeira de alta rotação',
                       serial_number: 'SEA007',
                       tools_group: 'Furadeiras',
                       status: 'Ativo')

    visit new_contract_path

    today = Time.zone.now

    select "#{tool.serial_number} #{tool.name}", from: 'contract[tool_ids][]'
    select "#{client.fantasy_name} #{client.state}", from: 'contract[client_id]'
    fill_in 'contract[term]', with: 15
    fill_in 'contract[initial_date]', with: today
    fill_in 'contract[total_price]', with: 3000.00
    fill_in 'contract[delivery_address]', with: 'Alameda Santos, 1293'
    fill_in 'contract[responsable]', with: ''

    within('form') do
      click_on 'Emitir Contrato'
    end

    expect(page).to have_content 'Campo obrigatório'
  end
end
