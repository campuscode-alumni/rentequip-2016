require 'rails_helper'

feature 'User list all clients' do
  scenario 'successfully' do
    # client = Client.create( razao_social: "Campus Code",
    #                         cnpj: "26.286.134/0001-04",
    #                         nome_contato: "Gustavo",
    #                         telefone: "555-555",
    #                         email: "g@code.com")

    client = create(:client)

    visit clients_path

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('26.286.134/0001-04')
  end
end
