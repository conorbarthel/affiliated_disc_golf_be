require 'rails_helper'

RSpec.describe 'root page' do

  it 'displays the attributes of all discs' do
    warehouse = Warehouse.create!(name: 'Discs R Us')
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4, quantity: 7856)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6, quantity: 1256)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, quantity: 254)
    discs = Disc.all
    visit root_path

    discs.each do |disc|
      expect(page).to have_content(disc.name)
      expect(page).to have_content(disc.plastic)
      expect(page).to have_content(disc.speed)
      expect(page).to have_content(disc.quantity)
    end

    expect(page).to_not have_content(warehouse.name)
  end

  it "has a button to create new discs" do
    visit root_path
    expect(page).to_not have_content("Undertaker")
    click_on "Create Disc"
    expect(current_path).to eq(new_disc_path)
    fill_in("Name", with:"Undertaker")
    fill_in("Plastic", with:"ESP")
    fill_in("Speed", with:9)
    fill_in("Quantity", with:999)
    click_on "Submit"
    expect(page).to have_content("Undertaker")
  end

  it "has a button to update each disc" do
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4, quantity: 7856)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6, quantity: 1256)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, quantity: 254)
    discs = Disc.all
    visit root_path

    discs.each do |disc|
      expect(page).to have_selector(:link_or_button, "Update #{disc.name}")
    end
    click_on "Update #{zone.name}"

    expect(current_path).to eq("/discs/#{zone.id}/edit")
    fill_in("Name", with:"Zoone")
    fill_in("Plastic", with:"ESP")
    fill_in("Speed", with:5)
    fill_in("Quantity", with:5856)
    click_on "Submit"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Zoone")
    expect(page).to_not have_content("Zone")
  end

  it "has a link to delete each disc" do
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4, quantity: 7856)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6, quantity: 1256)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2, quantity: 254)
    visit root_path

    expect(page).to have_selector(:link_or_button, "Delete #{rhyno.name}")
    expect(page).to have_content(leopard.name)

    click_on "Delete #{leopard.name}"

    expect(current_path).to eq("/")
    expect(page).to_not have_content(leopard.name)
  end

  it "has a button to create a new warehouse" do
    visit root_path

    expect(page).to have_content("Create Warehouse")
    click_on "Create Warehouse"

    expect(current_path).to eq(new_warehouse_path)
  end
end
