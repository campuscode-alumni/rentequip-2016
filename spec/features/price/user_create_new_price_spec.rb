require 'rails_helper'

feature 'User create a new price' do
  scenario 'successfully' do
    tools_group = create(:tools_group)
    visit new_price_path

    fill_in 'price_price', with: '123,55'
    select 'Furadeira', from: 'price_tools_group_id'
    select '1 quinzena', from: 'price_term'

    click_on 'Salvar'

    expect(page).to have_content('R$ 123,55')
    expect(page).to have_content(tools_group.name)
    expect(page).to have_content('15')
  end

  scenario 'create price with invalid characters in value input' do
    tools_group = create(:tools_group)
    visit new_price_path

    fill_in 'price_price', with: '@1$.aa23,55'
    select 'Furadeira', from: 'price_tools_group_id'
    select '1 quinzena', from: 'price_term'

    click_on 'Salvar'

    expect(page).to have_content('R$ 123,55')
    expect(page).to have_content(tools_group.name)
    expect(page).to have_content('15')
  end
end
