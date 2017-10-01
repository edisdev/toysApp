class AddToyUserIdToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :toy_user_id, :integer
  end
end
