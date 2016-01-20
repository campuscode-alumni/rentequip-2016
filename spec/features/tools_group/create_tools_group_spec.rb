require 'rails_helper'

feature 'User create a new tools group' do
  scenario 'sucessfully' do
    visit new_tools_group_path

    fill_in 'tools_group_name', with: 'Furadeiras'
    fill_in 'tools_group_description', with: 'Objetos furantes de furos furados'
    click_on 'Salvar'

    expect(page).to have_content 'Furadeiras'
    expect(page).to have_content 'Objetos furantes de furos furados'
  end

  scenario 'failed' do
    visit new_tools_group_path

    click_on 'Salvar'
    expect(page).to have_content 'Não foi possível salvar grupo de ferramentas'
  end

  scenario 'from tools group list' do
    visit tools_groups_path

    click_on 'Novo'

    fill_in 'tools_group_name', with: 'Furadeiras'
    fill_in 'tools_group_description', with: 'Objetos furantes de furos furados'
    click_on 'Salvar'

    expect(page).to have_content 'Furadeiras'
    expect(page).to have_content 'Objetos furantes de furos furados'
  end
end
