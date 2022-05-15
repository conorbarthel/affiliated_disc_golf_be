class CreateDiscWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_warehouses do |t|
      t.references :disc, foreign_key: true
      t.references :warehouse, foreign_key: true
    end
  end
end
