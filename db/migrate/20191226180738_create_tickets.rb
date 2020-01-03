class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
       t.belongs_to :flight, null: false 
      t.belongs_to :passenger, null: false

      t.timestamps
    end
  end
end
