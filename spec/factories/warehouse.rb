FactoryBot.define do
  factory :warehouse do
    warehouse_id { Faker::Number.within(range: 1..5) }
    disc_id { Faker::Number.within(range: 1..25) }
  end
end
