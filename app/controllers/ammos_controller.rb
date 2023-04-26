class AmmosController < ApplicationController
  def index
    @ammos = Ammo.all
  end

  def new
    @ammo = Ammo.new
  end

  def create
    ammo = Ammo.create ammo_params
    redirect_to ammo
  end

  def edit
    @ammo = Ammo.find params[:id]
  end

  def update
    ammo = Ammo.find params[:id]
    ammo.update ammo_params
    redirect_to ammo
  end

  def show
    @ammo = Ammo.find params[:id]
  end

  def destroy
    ammo = Ammo.find params[:id]
    ammo.destroy
    redirect_to ammos_path
  end

  private
  
  def ammo_params
    params.require(:ammo).permit(:name, :calibre, :manufacturer_id, :bullet_velocity, :fragmentation_chance, :ricochet_chance, :quantity, :image)
  end
end
