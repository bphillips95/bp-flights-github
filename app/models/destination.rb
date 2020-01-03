class Destination < ApplicationRecord
    has_many :flights
    has_many :tickets, through: :flights
    def location
        city + ', ' + country 
    end 
end
