class AddResnoteToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :res_note, :text
  end
end
