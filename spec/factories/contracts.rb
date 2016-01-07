FactoryGirl.define do
  factory :contract do
    client 'MyString'
    equipment 'MyString'
    term 1
    initial_date '2016-01-06'
    deadline '2016-01-06'
    total_price 1.5
    delivery_address 'MyString'
    responsable 'MyString'
  end
end
