FactoryBot.define do
  factory :purchase_address do
    token {Faker::String.random(length: 32)}
    postal_code {"123-4567"}
    prefectures {24}
    municipality {"名古屋市中村区"}
    house_number {"中村1-1-1"}
    building_name { '名古屋ハイツ' }
    phone_number {Faker::Number.leading_zero_number(digits: 11)}
    user_id {Faker::Number.within(range: 1..10)}
    item_id {Faker::Number.within(range: 1..10)}
  end
end
