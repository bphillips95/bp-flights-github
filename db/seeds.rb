# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Passenger.destroy_all
Destination.destroy_all
Flight.destroy_all
Ticket.destroy_all

john = Passenger.create(first_name: 'John', last_name: 'Smith')
matt = Passenger.create(first_name: 'Matt', last_name: 'Chapman')
ronald = Passenger.create(first_name: 'Ronald', last_name: 'Acuna')

lisbon = Destination.create(city: 'Lisbon', country: 'Portugal')
cape_town = Destination.create(city: 'Cape Town', country: 'South Africa')
sydney = Destination.create(city: 'Sydney', country: 'Australia')

flight1 = Flight.create(flight_number: 1, plane: 'Boeing 767', destination: lisbon)
flight2 = Flight.create(flight_number: 32, plane: 'Airbus 330', destination: cape_town)
flight3 = Flight.create(flight_number: 65, plane: 'Boeing 737', destination: sydney)

flight4 = Flight.create(flight_number: 43, plane: 'Boeing 767', destination: cape_town)
flight5 = Flight.create(flight_number: 876, plane: 'Airbus 330', destination: sydney)
flight6 = Flight.create(flight_number: 29, plane: 'Boeing 737', destination: lisbon)

Ticket.create(passenger: john, flight: flight2)
Ticket.create(passenger: matt, flight: flight1)
Ticket.create(passenger: ronald, flight: flight1)