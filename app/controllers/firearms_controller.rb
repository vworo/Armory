class FirearmsController < ApplicationController
    def index
        @firearms = Firearm.all
    end
  
    def new
        @firearm = Firearm.new
    end
  
    def create
        firearm = Firearm.create firearm_params
        redirect_to firearm
    end
  
    def edit
        @firearm = Firearm.find params[:id]
    end
  
    def update
        firearm = Firearm.find params[:id]
        firearm.update firearm_params
        redirect_to firearm
    end
  
    def show
        @firearm = Firearm.find params[:id]
    end
  
    def destroy
        firearm = Firearm.find params[:id]
        firearm.destroy
        redirect_to firearms_path
    end

    private
    def firearm_params
        params.require(:firearm).permit(:model, :calibre, :manufacturer_id, :family, :fire_rate, :effective_distance, :quantity, :image)
    end
end
