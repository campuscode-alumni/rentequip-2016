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
    # price = create(:price)

    tools_group_1 = create(:tools_group)
    tools_group_2 = create(:tools_group, name: 'Parafusadeiras')

    price_group_1_old = create(:price, price: 10, tools_group: tools_group_1)
    price_group_1_new = create(:price, price: 12, tools_group: tools_group_1)

    price_group_2_old = create(:price, price: 11, tools_group: tools_group_2)
    price_group_2_new = create(:price, price: 13, tools_group: tools_group_2)

    visit prices_path

    within('table tbody tr:first') do
      expect(page).to have_content('12.00')
      expect(page).to have_content('Furadeira')
      expect(page).to have_content(15)
    end

    within('table tbody tr:last') do
      expect(page).to have_content('13.00')
      expect(page).to have_content('Parafusadeiras')
      expect(page).to have_content(15)
    end

  end
end
