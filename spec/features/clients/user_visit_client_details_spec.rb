require 'rails_helper'

feature 'User visit client detail' do
  scenario 'successfully' do
    client = create(:client)

    visit client_path client

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('26.286.134/0001-04')
    expect(page).to have_content('Alameda Santos')
  end

  scenario 'from clients list' do
    create(:client)

    visit clients_path

    click_on 'Campus Code'

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('26.286.134/0001-04')
    expect(page).to have_content('Alameda Santos')
    expect(page).to have_content('1293')
    expect(page).to have_content('conj 73')
    expect(page).to have_content('12345-789')
    expect(page).to have_content('Cerqueira Cesar')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('SP')
    expect(page).to have_content('Gustavo')
    expect(page).to have_content('555-555')
    expect(page).to have_content('g@code.com')
  end
end
