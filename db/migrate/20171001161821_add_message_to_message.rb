class AddMessageToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :message, :text
  end
end
