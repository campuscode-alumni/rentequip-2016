require 'rails_helper'

feature 'Show contract' do
  scenario 'successfully' do
    contract = Contract.create(client: 'Roberto',
                            equipment: 'Betoneira',
                            term: 15,
                            initial_date: Time.zone.now,
                            deadline: 15.days.from_now,
                            total_price: 30.00,
                            delivery_address: 'Alameda Santos, 1293',
                            responsable: 'Alan')

    visit contract_path contract


    expect(page).to have_content 'Roberto'
    expect(page).to have_content 'Betoneira'
    expect(page).to have_content 15
    expect(page).to have_content contract.initial_date
    expect(page).to have_content contract.deadline
    expect(page).to have_content 30.00
    expect(page).to have_content 'Alameda Santos, 1293'
    expect(page).to have_content 'Alan'
  end
end
