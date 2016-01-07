require 'rails_helper'

feature 'User visit client detail' do
  scenario 'successfully' do
    client = create(:client)

    visit client_path client

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('26.286.134/0001-04')
    expect(page).to have_content('Alameda Santos')
  end
end
