25.times do
  Disc.create(
  name: Faker::Science.element,
  plastic: Faker::Science.element_state,
  speed: Faker::Number.within(range: 1..15),
  quantity: Faker::Number.within(range: 1..10000)
)
end

5.times do
  Warehouse.create(
    name: Faker::Commerce.vendor
)
end

25.times do
  DiscWarehouse.create(
    warehouse_id: Faker::Number.within(range: 1..5),
    disc_id: Faker::Number.within(range: 1..25)
  )
end
