class MandaloriansController < ApplicationController
    before_action :set_mandalorian, only: [:show, :edit, :update, :destroy]

    def index 
        @mandalorians = Mandalorian.all 
    end 

    def new 
        @mandalorian = Mandalorian.new 
    end 

    def create 
        @mandalorian = Mandalorian.new(mandalorian_params)
        if @mandalorian.save 
            redirect_to @mandalorian
        else 
            render :new 
        end 
    end

    def edit 
    end 

    def update 
        if @mandalorian.update(mandalorian_params)
            redirect_to @mandalorian 
        else  
            render :edit 
        end 
    end 

    def destroy 
        @mandalorian.destroy
        redirect_to mandalorians_path
    end 

    private 

    def set_mandalorian 
        @mandalorian = Mandalorian.find(params[:id])
    end 

    def mandalorian_params
        params.require(:mandalorian).permit(:name, :spaceship, :companion)
    end 
end