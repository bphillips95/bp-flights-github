class PassengersController < ApplicationController
    # before_action :require_login
    def index 
        @passengers = Passenger.all
    end 

    def show 
        @passenger = Passenger.find(params[:id])
    end 

    def new
        @passenger = Passenger.new 
    end

    def create 
        @passenger = Passenger.create(first_name: params[:passenger][:first_name],
        last_name: params[:passenger][:last_name])
        
        if @passenger.save
        redirect_to passenger_path(@passenger)
        else  
            flash[:notice] = 'The Passenger was not created'
            redirect_to passengers_path
        end 
    end
end
