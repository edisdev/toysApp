class RenameResUserIdInReservationToResUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :res_user, :res_user_id
  end
end
