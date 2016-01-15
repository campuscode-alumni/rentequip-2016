require 'rails_helper'

feature 'User list Tools group' do
  scenario 'sucessfully' do
    toolsgroup = create(:tools_group)

    visit tools_groups_path

    expect(page).to have_content(toolsgroup.name)
    expect(page).to have_content(toolsgroup.description)
  end
end
