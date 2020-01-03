class AddDestinationsToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :flight_number, :integer
    add_column :flights, :plane, :string
    add_column :flights, :destination_id, :belongs_to
  end
end
