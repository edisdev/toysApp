class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :toy_id
      t.integer :res_user
      t.date :res_start_date
      t.date :res_finish_date

      t.timestamps
    end
  end
end
