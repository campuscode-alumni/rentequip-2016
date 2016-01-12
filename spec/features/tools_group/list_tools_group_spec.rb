require 'rails_helper'

feature 'Tools group list tools' do
  scenario 'sucessfully' do
    toolsgroup = create(:tools_group)

    visit tools_groups_path

    expect(page).to have_content(toolsgroup.name)
  end
end
