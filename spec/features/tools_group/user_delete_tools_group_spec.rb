require 'rails_helper'

feature 'User delete Tools Group' do
  scenario 'sucessfully' do
    tools_group = create(:tools_group)

    visit tools_group_path(tools_group)

    click_on 'Excluir'

    expect(page).to have_content('Grupo excluido com sucesso')
  end

  scenario 'failed' do
    tool = create(:tool)

    visit tools_group_path(tool.tools_group)

    expect(page).not_to have_button('Excluir')
  end
end
