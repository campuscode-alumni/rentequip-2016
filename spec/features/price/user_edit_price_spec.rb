require 'rails_helper'

feature 'User edit price' do
  scenario 'successfully' do
    price = create(:price)
    visit price_path(price)

    click_on 'Atualizar'

    fill_in 'price_price', with: '99.90'

    click_on 'Salvar'

    expect(page).to have_content('R$ 99,90')
    expect(page).to have_content(price.tools_group.name)
    expect(page).to have_content('15')
  end

  scenario 'and load current data from url' do
    price = create(:price)
    visit price_path(price)

    expect(page).to_not have_content('R$ 9,90')
    expect(page).to have_content(price.tools_group.name)
    expect(page).to have_content('15')
  end

  scenario 'and expect new_path to current url' do
    price = create(:price)
    visit price_path(price)

    expect(page).to have_current_path(price_path(price))
  end
end
