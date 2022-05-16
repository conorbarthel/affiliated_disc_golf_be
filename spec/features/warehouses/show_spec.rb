require 'rails_helper'

RSpec.describe 'warehouse show page' do

  it 'displays the name of the warehouse' do
    warehouse = Warehouse.create!(name: 'Discs R Us')
    warehouse2 = Warehouse.create!(name: 'Not Me')

    visit warehouse_path(warehouse)

    expect(page).to have_content(warehouse.name)
    expect(page).to_not have_content(warehouse2.name)
  end

  it "shows what discs are at that location" do
    warehouse = Warehouse.create!(name: 'Discs R Us')
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4, quantity: 7856)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6, quantity: 1256)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, quantity: 254)
    inventory_1 = DiscWarehouse.create!(disc_id: zone.id, warehouse_id: warehouse.id)
    inventory_2 = DiscWarehouse.create!(disc_id: leopard.id, warehouse_id: warehouse.id)

    within "div.current_stock" do
      expect(page).to have_content(zone.name)
      expect(page).to have_content(leopard.name)
      expect(page).to_not have_content(rhyno.name)
    end
  end

  it 'can add inventory to this location' do
    warehouse = Warehouse.create!(name: 'Discs R Us')
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4, quantity: 7856)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6, quantity: 1256)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, quantity: 254)
    inventory_1 = DiscWarehouse.create!(disc_id: zone.id, warehouse_id: warehouse.id)
    inventory_2 = DiscWarehouse.create!(disc_id: leopard.id, warehouse_id: warehouse.id)

    within "div.current_stock" do
      expect(page).to_not have_content("Rhyno")
    end

    within "div.add_inventory" do
      click_on "Add Rhyno"
    end

    within "div.current_stock" do
      expect(page).to have_content("Rhyno")
    end
  end
end
