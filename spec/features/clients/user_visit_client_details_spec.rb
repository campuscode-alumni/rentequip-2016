require 'rails_helper'

feature 'User visit client detail' do
  scenario 'successfully' do
    client = create(:client)

    visit client_path client

    expect(page).to have_content(client.company_name)
    expect(page).to have_content(client.cnpj)
    expect(page).to have_content(client.address)
  end

  scenario 'from clients list' do
    client = create(:client)

    visit clients_path

    click_on 'Campus Code'

    expect(page).to have_content(client.company_name)
    expect(page).to have_content(client.cnpj)
    expect(page).to have_content(client.contact_name)
    expect(page).to have_content(client.phone)
    expect(page).to have_content(client.email)
    expect(page).to have_content(client.address)
    expect(page).to have_content(client.address_number)
    expect(page).to have_content(client.aditional_address_detail)
    expect(page).to have_content(client.zipcode)
    expect(page).to have_content(client.neighborhood)
    expect(page).to have_content(client.city)
    expect(page).to have_content(client.state)
  end
end
