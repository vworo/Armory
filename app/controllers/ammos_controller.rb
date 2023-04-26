class AmmosController < ApplicationController
  before_action :check_if_owner, :only => [:show]

  def index
    @ammos = Ammo.where(:user_id => @current_user.id)
  end

  def new
    @ammo = Ammo.new
  end

  def create
    ammo = Ammo.create ammo_params
    ammo.update(:user_id => @current_user.id)

    @current_user.firearms.where(calibre: ammo.calibre).each do |firearm|
      ammo.firearms << firearm
    end
    
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

  def check_if_owner
    ammo = Ammo.find_by :id => params[:id]
    redirect_to root_path unless @current_user.id == ammo.user_id
  end
end
