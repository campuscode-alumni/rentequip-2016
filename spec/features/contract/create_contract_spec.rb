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

    select client.company_name, from: 'contract[client_id]'
    select tool.name, from: 'contract[tool_ids][]'
    fill_in 'contract[term]', with: 15
    fill_in 'contract[initial_date]', with: today
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

  scenario 'loads current data as default' do
    create(:client)
    create(:tool)

    visit new_contract_path

    today = Time.zone.now.strftime('%d/%m/%Y')

    expect(page).to have_field 'contract[initial_date]', with: today
  end

  scenario 'loads a list with clients name and state' do
    client = create(:client)
    create(:tool)

    visit new_contract_path

    expect(page).to have_content("#{client.company_name} #{client.state}")
    # TODO: ALTERAR COMPANY_NAME PARA FANTASY_NAME QUANDO O CAMPO FOR CRIADO
  end

  scenario 'loads a list with tools serial number' do
    create(:client)
    tool = create(:tool)

    visit new_contract_path

    expect(page).to have_content("#{tool.serial_number} #{tool.name}")
  end
end
