class DestinationsController < ApplicationController
    before_action :require_login
    def index
        @destinations = Destination.all
    end 

    def new
        @destination = Destination.new 
    end

    def create 
        @destination = Destination.create(city: params[:destination][:city], country: params[:destination][:country])
        redirect_to new_destination_path
    end 
end
