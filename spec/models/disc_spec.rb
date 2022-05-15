require 'rails_helper'

RSpec.describe Disc, type: :model do
  describe 'relationships' do
    it {should have_many :disc_warehouses}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :plastic}
    it {should validate_numericality_of :speed}
    it {should validate_numericality_of :quantity}
  end
end
