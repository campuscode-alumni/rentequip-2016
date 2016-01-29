require 'rails_helper'

feature 'Issue delivery receipt' do
  scenario 'create a new delivery receipt' do
    tool = create(:tool)
    contract = build(:contract)
    contract.tools << tool
    contract.save

    visit root_path

    click_on '2016001'

    expect(page).not_to have_link 'Emitir Recibo de Devolução'

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
    contract.delivery_receipt = build(:delivery_receipt)
    contract.save

    today = Time.zone.now
    date = "São Paulo, #{today.day}/#{today.month}/#{today.year}"

    travel_to 1.day.from_now do
      visit root_path

      click_on '2016001'

      expect(page).not_to have_link 'Emitir Recibo de Entrega'

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
