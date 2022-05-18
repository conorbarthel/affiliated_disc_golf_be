class DiscsController < ApplicationController
  def new;end

  def create
    new_disc = Disc.create(disc_params)
    redirect_to root_path
  end

  def edit
    @disc = Disc.find(params[:id])
  end

  def update
    disc = Disc.find(params[:id])
    disc.update(disc_params)
    redirect_to root_path
  end

  def destroy
    disc = Disc.find(params[:id])
    disc.destroy
    redirect_to root_path
  end

  private
    def disc_params
      params.permit(:name, :plastic, :speed, :quantity)
    end
end
