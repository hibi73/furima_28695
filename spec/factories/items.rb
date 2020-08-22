FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 2..11)}
    status_id {Faker::Number.within(range: 2..7)}
    burden_id {Faker::Number.within(range: 2..3)}
    region_id {Faker::Number.within(range: 2..48)}
    days_id {Faker::Number.within(range: 2..4)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user
  end
end
