FactoryBot.define do
  factory :disc do
    name { Faker::Science.element }
    plastic { Faker::Science.element_state }
    speed { Faker::Number.within(range: 1..15) }
    quantity { Faker::Number.within(range: 1..10000) }
  end
end
