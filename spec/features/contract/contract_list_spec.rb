require 'rails_helper'

feature 'List contracts' do
  scenario 'successfully' do
    client = create(:client)

    tool = create(:tool)

    contract = build(:contract)
    contract.tools << tool
    contract.save

    visit root_path

    expect(page).to have_content "#{client.fantasy_name} #{client.state}"
    expect(page).to have_content tool.name
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')

    click_on '2016001'

    expect(page).to have_content "#{client.fantasy_name} #{client.state}"
    expect(page).to have_content tool.name
    expect(page).to have_content contract.term
    expect(page).to have_content contract.initial_date.strftime('%d/%m/%Y')
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
    expect(page).to have_content 'R$ 3.000,00'
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.responsable
  end

  scenario 'create a new delivery receipt' do
    tool = create(:tool)

    contract = build(:contract)
    contract.tools << tool
    contract.save

    visit root_path

    click_on '2016001'

    click_on 'Emitir Recibo de Entrega'

    today = Time.zone.now
    date = "São Paulo, #{today.day}/#{today.month}/#{today.year}"

    expect(page).to have_content date
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.client.company_name
    expect(page).to have_content contract.client.cnpj
    expect(page).to have_content tool.name
    expect(page).to have_content contract.term
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.initial_date.strftime('%d/%m/%Y')
    expect(page).to have_content '2016001'
  end

  scenario 'show an already emitted delivery receipt' do
    tool = create(:tool)

    contract = build(:contract)
    contract.tools << tool
    contract.save

    visit root_path

    click_on '2016001'

    click_on 'Emitir Recibo de Entrega'

    today = Time.zone.now
    date = "São Paulo, #{today.day}/#{today.month}/#{today.year}"

    travel_to 1.day.from_now do
      visit root_path

      click_on '2016001'

      expect(page).not_to have_content 'Emitir Recibo de Entrega'
      expect(page).to have_content 'Visualizar Recibo de Entrega'

      click_on 'Visualizar Recibo de Entrega'

      expect(page).to have_content date
      expect(page).to have_content contract.responsable
      expect(page).to have_content contract.client.company_name
      expect(page).to have_content contract.client.cnpj
      expect(page).to have_content tool.name
      expect(page).to have_content contract.term
      expect(page).to have_content contract.delivery_address
      expect(page).to have_content contract.initial_date.strftime('%d/%m/%Y')
      expect(page).to have_content '2016001'
    end
  end
end
