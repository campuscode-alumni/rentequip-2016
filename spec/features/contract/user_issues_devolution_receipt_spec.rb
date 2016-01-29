require 'rails_helper'

feature 'Issue devolution receipt' do
  scenario 'Create a new devolution receipt' do
    tool = create(:tool)
    contract = build(:contract)
    contract.tools << tool
    contract.delivery_receipt = build(:delivery_receipt)
    contract.save

    today = Time.zone.now
    date = "São Paulo, #{today.day}/#{today.month}/#{today.year}"

    visit root_path

    click_on '2016001'

    expect(page).not_to have_link 'Emitir Recibo de Entrega'
    expect(page).to have_link 'Visualizar Recibo de Entrega'

    fill_in 'employee', with: 'João'

    click_on 'Emitir Recibo de Devolução'

    expect(page).to have_content 'João'
    expect(page).to have_content date
    expect(page).to have_content tool.name
    expect(page).to have_content '2016001'
    expect(page).to have_content contract.client.company_name
    expect(page).to have_content contract.client.cnpj
    expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
  end

  scenario 'show an already emitted devolution receipt' do
    tool = create(:tool)
    contract = build(:contract)
    contract.tools << tool
    contract.delivery_receipt = build(:delivery_receipt)
    contract.save

    visit root_path

    click_on '2016001'

    fill_in 'employee', with: 'João'

    click_on 'Emitir Recibo de Devolução'

    today = Time.zone.now
    date = "São Paulo, #{today.day}/#{today.month}/#{today.year}"

    travel_to 1.day.from_now do
      visit root_path

      click_on '2016001'

      expect(page).not_to have_link 'Emitir Recibo de Devolução'
      expect(page).to have_link 'Visualizar Recibo de Devolução'
      expect(page).to have_link 'Visualizar Recibo de Entrega'

      click_on 'Visualizar Recibo de Devolução'

      expect(page).to have_content 'João'
      expect(page).to have_content date
      expect(page).to have_content tool.name
      expect(page).to have_content '2016001'
      expect(page).to have_content contract.client.company_name
      expect(page).to have_content contract.client.cnpj
      expect(page).to have_content contract.deadline.strftime('%d/%m/%Y')
    end
  end
end
