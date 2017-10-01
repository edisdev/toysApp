class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.text :description
      t.string :toy_type
      t.integer :user_id

      t.timestamps
    end
  end
end
