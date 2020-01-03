class Addconfirmationtotickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :confirmation, :integer
  end
end
