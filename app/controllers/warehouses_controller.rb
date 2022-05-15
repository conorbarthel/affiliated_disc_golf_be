class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
    @discs = @warehouse.discs
  end

  def new;end

  def create
    warehouse = Warehouse.create(warehouse_params)
    redirect_to warehouse_path(warehouse.id)
  end

  private
    def warehouse_params
      params.permit(:name)
    end
end
