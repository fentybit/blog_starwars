class ArmorsController < ApplicationController
    before_action :set_armor, only: [:show, :edit, :update, :destroy]

    def index
        @armors = Armor.all
    end 

    def new 
        @armor = Armor.new 
    end 

    def create 
        @armor = Armor.new(armor_params)
        if @armor.save 
            redirect_to @armor 
        else  
            render :new 
        end 
    end 

    def edit 
    end 

    def update 
        if @armor.update(armor_params)
            redirect_to @mandalorian 
        else  
            render :edit 
        end 
    end 

    def destroy 
        @armor.destroy 
        redirect_to armors_path
    end 

    private 

    def set_armor 
        @armor = Armor.find(params[:id])
    end 

    def armor_params
        params.require(:armor).permit(:name, :description)
    end 

end