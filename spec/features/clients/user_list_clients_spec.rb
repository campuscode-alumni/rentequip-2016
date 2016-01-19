require 'rails_helper'

feature 'User list all clients' do
  scenario 'successfully' do
    clients = create_list :client, 3

    visit clients_path

    clients.each do |client|
      expect(page).to have_content(client.fantasy_name)
      expect(page).to have_content(client.cnpj)
    end
  end
end
