class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :whose_id
      t.string :subject

      t.timestamps
    end
  end
end
