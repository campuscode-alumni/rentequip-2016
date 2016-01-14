require 'rails_helper'

feature 'User create a new tools group' do
  scenario 'sucessfully' do
    visit new_tools_group_path

    fill_in('tools_group_name', with: 'Furadeiras')
    click_on 'Salvar'

    expect(page).to have_content('Furadeiras')
  end
  scenario 'failed' do
    visit new_tools_group_path

    click_on 'Salvar'
    expect(page).to have_content('Atenção! Todos os campos são obrigatórios.')
  end
end
