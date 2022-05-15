require 'rails_helper'

RSpec.describe 'root page' do

  it 'displays the attributes of all discs' do
    warehouse = Warehouse.create!(name: 'Discs R Us')
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2)

    discs = Disc.all
    #binding.pry
    visit root_path

    discs.each do |disc|
      expect(page).to have_content(disc.name)
      expect(page).to have_content(disc.plastic)
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
    click_on "Submit"
    expect(page).to have_content("Undertaker")
  end

  it "has a button to update each disc" do
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2)
    discs = Disc.all
    visit root_path

    discs.each do |disc|
      expect(page).to have_selector(:link_or_button, "Update #{disc.name}")
    end
    click_on "Update #{zone.name}"

    expect(current_path).to eq("/discs/#{zone.id}/edit")
  end

  it "has a link to delete each disc" do
    zone = Disc.create!(name: 'Zone', plastic: 'Glow', speed: 4)
    leopard = Disc.create!(name: 'Leopard', plastic: 'DX', speed: 6)
    rhyno = Disc.create!(name: 'Rhyno', plastic: 'R-Pro', speed: 2)
    visit root_path
    
    expect(page).to have_selector(:link_or_button, "Delete #{rhyno.name}")
    expect(page).to have_content(leopard.name)

    click_on "Delete #{leopard.name}"

    expect(current_path).to eq("/")
    expect(page).to_not have_content(leopard.name)
  end
end
