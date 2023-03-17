FactoryBot.define do
  factory :order_form do
    
    post_cord             { '123-1234' }
    delivery_area_id      {Faker::Number.between(from:1, to:47)}
    municipality          { '川崎市' }
    address               { '1-2-4'}
    phone_number          { '01020304050' }
    building_name         { '坂本ビル' }
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
