class Warehouse < ApplicationRecord
  has_many :disc_warehouses
  has_many :discs, through: :disc_warehouses
  validates :name, presence: true
end
