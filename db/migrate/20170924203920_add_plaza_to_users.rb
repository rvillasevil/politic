class AddPlazaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :plaza, :boolean
  end
end
