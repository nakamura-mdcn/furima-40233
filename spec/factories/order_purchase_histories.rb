FactoryBot.define do
  factory :order_purchase_history do
    postal_code           {'111-1111'}
    prefecture_id         {2}
    city                  {Faker::Address.city}
    addresses             {"青山1-1"}
    building              {'青山ハイツ'}
    phone_number          {12345678910}
  end
end
