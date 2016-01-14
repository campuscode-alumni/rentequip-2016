require 'rails_helper'

feature 'User update Tools Group' do
  scenario 'sucessfully' do
    tools_group = create(:tools_group)

    visit edit_tools_group_path(tools_group)

    fill_in 'tools_group_name', with: 'Parafusadeiras'
    click_on 'Atualizar'

    expect(page).to have_content('Parafusadeiras')
  end
  scenario 'failed' do
    tools_group = create(:tools_group)

    visit edit_tools_group_path(tools_group)

    fill_in 'tools_group_name', with: ''
    click_on 'Atualizar'
    expect(page).to have_content('Atenção! Todos os campos são obrigatórios.')
  end
end
