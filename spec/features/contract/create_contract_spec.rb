require 'rails_helper'

feature 'Create a new Contract' do
  scenario 'successfully' do
    client = create(:client)

    tool = create(:tool)

    visit new_contract_path

    today = Time.zone.now

    select "#{tool.serial_number} #{tool.name}", from: 'contract[tool_ids][]'
    select "#{client.fantasy_name} #{client.state}", from: 'contract[client_id]'
    fill_in 'contract[term]', with: 15
    fill_in 'contract[initial_date]', with: today
    fill_in 'contract[total_price]', with: 3000.00
    fill_in 'contract[delivery_address]', with: 'Alameda Santos, 1293'
    fill_in 'contract[responsable]', with: 'Alan'

    within('form') do
      click_on 'Emitir Contrato'
    end

    contract = Contract.last
    expect(page).to have_content "#{client.fantasy_name} #{client.state}"
    expect(page).to have_content tool.name
    expect(page).to have_content contract.term
    expect(page).to have_content contract.initial_date.strftime('%d/%m/%Y')
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
    expect(page).to have_content 'R$ 3.000,00'
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

    expect(page).to have_content("#{client.fantasy_name} #{client.state}")
  end

  scenario 'loads a list with tools serial number' do
    create(:client)
    tool = create(:tool)

    visit new_contract_path

    expect(page).to have_content("#{tool.serial_number} #{tool.name}")
  end
end
