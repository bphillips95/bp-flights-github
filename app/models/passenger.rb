class Passenger < ApplicationRecord
    has_many :tickets
    has_many :flights, through: :tickets
    
    def full_name
        first_name + ' ' + last_name 
    end 
end
