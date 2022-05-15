class AddQuantityToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :quantity, :integer
  end
end
