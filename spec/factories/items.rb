FactoryBot.define do
  factory :item do
    name                     {Faker::Name.initials(number: 2)}
    information              {Faker::Lorem.sentence}
    category_id              {4}
    sales_status_id          {3}
    shipping_fee_status_id   {3}
    prefecture_id            {3}
    scheduled_delivery_id    {3}
    price                    {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
