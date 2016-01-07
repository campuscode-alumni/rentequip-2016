require 'rails_helper'

feature 'User list prices' do
  scenario 'successfully' do
    price = Price.create(price: 99.90,
                         tools_group: 'Furadeira',
                         deadline: 30)

    visit prices_path

    expect(page).to have_content (price.price)
    expect(page).to have_content (price.tools_group)
    expect(page).to have_content (price.deadline)
  end
end
