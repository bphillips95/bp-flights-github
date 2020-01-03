class FlightsController < ApplicationController
    before_action :require_login
    def index
        @flights = Flight.all 
    end 

    def show 
        @flight = Flight.find(params[:id])
    end 

    def new 
        @flight = Flight.new 
    end 

    def create 
        @flight = Flight.create(plane: params[:flight][:plane],flight_number: params[:flight][:flight_number],
        destination_id: params[:flight][:destination_id])
        redirect_to new_flight_path
    end 

end
