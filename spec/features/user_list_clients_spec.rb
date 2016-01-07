require 'rails_helper'

feature 'User list all clients' do
  scenario 'successfully' do
    create(:client)

    visit clients_path

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('26.286.134/0001-04')
  end
end
