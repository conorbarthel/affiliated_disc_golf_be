class DiscWarehousesController < ApplicationController
  def create
    warehouse = Warehouse.find(params[:warehouse_id])
    disc = Disc.find(params[:disc_id])
    DiscWarehouse.create(disc_id: disc.id, warehouse_id: warehouse.id)
    redirect_to warehouse_path(warehouse)
  end
end
