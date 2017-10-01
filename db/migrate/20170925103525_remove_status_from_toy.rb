class RemoveStatusFromToy < ActiveRecord::Migration[5.1]
  def change
    remove_column :toys, :status, :boolean
  end
end
