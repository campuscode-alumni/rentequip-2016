require 'rails_helper'

feature 'User list prices' do
  scenario 'successfully' do
    price = create(:price)

    visit prices_path

    expect(page).to have_content(price.price)
    expect(page).to have_content(price.tools_group.name)
    expect(page).to have_content(price.term)
  end

  scenario 'list last price' do
    price = create(:price)

    4.times do |n|
      create(:price, price: (n+10))
    end

    visit prices_path

    expect(page).to have_content(13)
    expect(page).not_to have_content(10)

  end
end
