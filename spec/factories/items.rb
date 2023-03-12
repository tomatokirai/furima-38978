FactoryBot.define do
  factory :item do
    association :user

    name                  {Faker::Name.name}
    price                 {Faker::Number.between(from:300, to:9_999_999)}
    item_text             {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from:1, to:12)}
    situation_id          {Faker::Number.between(from:1, to:6)}
    shipping_id           {Faker::Number.between(from:1, to:2)}
    delivery_area_id      {Faker::Number.between(from:1, to:47)}
    delivery_day_id       {Faker::Number.between(from:1, to:3)}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
