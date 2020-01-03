class Flight < ApplicationRecord
    belongs_to :destination
    has_many :tickets
    has_many :passengers, through: :tickets
end
