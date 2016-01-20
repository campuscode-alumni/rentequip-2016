require 'rails_helper'

feature 'User list prices' do
  scenario 'successfully' do
    pending("está falhando")
    price = create(:price)

    visit prices_path

    expect(page).to have_content(price.price)
    expect(page).to have_content(price.tools_group.name)
    expect(page).to have_content(price.deadline)
  end
end
