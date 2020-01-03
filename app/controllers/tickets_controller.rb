class TicketsController < ApplicationController
    
    def index 
        @tickets = Ticket.all
    end 

    def choose_passenger
        @passenger = Passenger.new
        # @passengers = Passenger.all
        @ticket = Ticket.new
        render :choose_passenger
    end 

    def create_passenger
        @passenger = Passenger.create(first_name: params[:passenger][:first_name],
        last_name: params[:passenger][:last_name])
        session[:passenger] = @passenger
        redirect_to tickets_destinations_path
    end 

    def choose_destination
      
        # @passenger = Passenger.find(params[:passenger_id])
        # session[:passenger] = @passenger
        @destinations = Destination.all 
        render :choose_destination
    end 

    def choose_flight
        # @passenger = Passenger.find(params[:passenger_id])
        
        @destination = Destination.find(params[:destination_id])
        @flights = Flight.all
        render :choose_flight
    end 

    def check_out 
        @flight = Flight.find(params[:flight_id])
        # @passenger = Passenger.all.select{|passenger| passenger.id == session[:passenger]['id']}
        # @passenger = Passenger.find(params[:session][:passenger_id])
        Passenger.all.each do |passenger| 
            if passenger.id == session[:passenger]['id']
                @passenger = passenger
            end 
        end 
        # @passenger and @flight are here as instances
        # not saving passenger id in params
        @ticket = Ticket.new
        render :check_out
    end 

    def new 
        @flight = Flight.find(params[:flight_id])
        @ticket = Ticket.new
        @passengers = Passenger.all
        render :new
    end 

    def create
        # drop down menu for destinations
        # should carry the passenger from earlier screen
        # first page selects destination 2nd page gives flights for that destination
        @ticket = Ticket.create(passenger_id: params[:passenger_id],flight_id: params[:flight_id],
        confirmation: Random.rand(100000...999999))
        redirect_to tickets_booked_path
    end 
    
    def booked
        @ticket = Ticket.last
        render :booked
    end 

    def confirmation
        @ticket = Ticket.find_by(confirmation: params[:confirmation])
        if @ticket != nil 
        render :booked
        else  
            flash[:notice] = 'Sorry, This flight is not in the database'
            redirect_to tickets_path
        end 
    end

    def destroy 
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        flash[:notice] = "Your Ticket has been cancelled"
        redirect_to tickets_path
    end 

end
# page 1 = choose passenger 
# page 2 = choose destination
# page 3 = choose flight (iterate through chosen destination)
# page 4 = check out, create ticket with flight and passenger
# page 5 = flight is booked, stuff to do in Portugal

# possibly iterate have each iteration a link which persists it to the next page

# params: {passenger_id: @passenger.id}, params: {flight_id: @flight.id }

