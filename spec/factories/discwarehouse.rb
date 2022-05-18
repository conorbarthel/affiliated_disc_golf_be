FactoryBot.define do
  factory :disc_warehouse do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.word }
    unit_price { Faker::Commerce.name }
  end
end
