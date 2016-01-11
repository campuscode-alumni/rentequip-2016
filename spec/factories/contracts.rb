FactoryGirl.define do
  factory :contract do
    client
    term 15
    initial_date Time.zone.now
    deadline 15.days.from_now
    total_price 30.00
    delivery_address 'Alameda Santos, 1293'
    responsable 'Alan'
  end
end
