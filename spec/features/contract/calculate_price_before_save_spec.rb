require 'rails_helper'

feature 'Calculate contract price before save' do
  scenario 'successfully', js: true do
    create(:client)
    tool = create(:tool)
    # TODO: trocar deadline por term
    create(:price, tools_group: tool.tools_group, deadline: 15, price: 9.99)

    visit new_contract_path

    select "#{tool.serial_number} #{tool.name}", from: 'contract[tool_ids][]'
    select '1 quinzena', from: 'contract[term]'
    expect(find_field('Preço do contrato').value).to have_content 'R$ 9,99'
  end

  scenario 'when contract have more than one tool', js: true do
    create(:client)
    tool1 = create(:tool)
    tool2 = create(:tool, name: 'Furadeira 2', serial_number: 'SAE008')
    create(:price, tools_group: tool1.tools_group, deadline: 15, price: 15)
    create(:price, tools_group: tool2.tools_group, deadline: 15, price: 30)

    visit new_contract_path

    select "#{tool1.serial_number} #{tool1.name}", from: 'contract[tool_ids][]'
    select "#{tool2.serial_number} #{tool2.name}", from: 'contract[tool_ids][]'
    select '1 quinzena', from: 'contract[term]'
    expect(find_field('Preço do contrato').value).to have_content 'R$ 45,00'
  end
end
