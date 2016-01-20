require 'rails_helper'

feature 'User create a new price' do
  scenario 'successfully' do
    visit new_price_path
    tools_group = create(:tools_group)

    fill_in 'price', with: '123.55'
    page.select 'Furadeira', from: 'tools_group_id'
    page.select '60', from: 'term_id'

    click_on 'Salvar'

    expect(page).to have_content(price.price)
    expect(page).to have_content(price.tools_group.name)
    expect(page).to have_content(price.term)
  end
end
