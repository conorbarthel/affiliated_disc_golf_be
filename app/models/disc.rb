class Disc < ApplicationRecord
  has_many :disc_warehouses, dependent: :destroy 
  has_many :warehouses, through: :disc_warehouses
  validates :name, presence: true
  validates :plastic, presence: true
  validates :speed, numericality: true
  validates :quantity, numericality: true
end
