require 'rails_helper'

feature 'User list tools' do
  scenario 'Sucessfully' do
    tool = create(:tool)

    visit tools_path

    expect(page).to have_content tool.name
    expect(page).to have_content tool.description
    expect(page).to have_content tool.serial_number
    expect(page).to have_content tool.tools_group.name
    expect(page).to have_content tool.status
  end
end
