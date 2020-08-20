FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category {Faker::Number.within(range: 2..11)}
    status {Faker::Number.within(range: 2..7)}
    burden {Faker::Number.within(range: 2..3)}
    region {Faker::Number.within(range: 2..48)}
    days {Faker::Number.within(range: 2..4)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user
  end
end
