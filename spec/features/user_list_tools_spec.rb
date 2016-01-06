require "rails_helper"

feature "User list tools" do

  scenario "Sucessfully" do

      tool = Tool.create(name: "Furadeira Blackdecker",
                  description: "Furadeira de alta rotação",
                  serial_number: "SEA007",
                  tools_group: "Furadeiras",
                  status: "Ativo")

      visit tools_path

      expect(page).to have_content tool.name
      expect(page).to have_content tool.description
      expect(page).to have_content tool.serial_number
      expect(page).to have_content tool.tools_group
      expect(page).to have_content tool.status

  end
end
