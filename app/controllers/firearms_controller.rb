class FirearmsController < ApplicationController
    before_action :check_if_owner, :only => [:show, :edit]

    def index
        @firearms = Firearm.where(:user_id => @current_user.id)
    end
  
    def new
        @firearm = Firearm.new
    end
  
    def create
        firearm = Firearm.create firearm_params
        firearm.update(:user_id => @current_user.id)

        # Auto associate ammos that share the same calibre string 
        @current_user.ammos.where(:calibre => firearm.calibre).each do |ammo|
            firearm.ammos << ammo
        end

        if params[:file].present?
            req = Cloudinary::Uploader.upload(params[:file])
            firearm.image = req["public_id"]
            firearm.save
        end

        redirect_to firearm
    end
  
    def edit
        @firearm = Firearm.find params[:id]
    end
  
    def update
        firearm = Firearm.find params[:id]

        if params[:file].present?
            req = Cloudinary::Uploader.upload(params[:file])
            firearm.image = req["public_id"]
            firearm.save
        end

        firearm.update firearm_params

        # Auto associate ammos that share the same calibre string 
        firearm.ammos.destroy_all
        @current_user.ammos.where(:calibre => firearm.calibre).each do |ammo|
            firearm.ammos << ammo
        end

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

    def check_if_owner
        firearm = Firearm.find_by :id => params[:id]
        redirect_to root_path unless @current_user.id == firearm.user_id
    end
end