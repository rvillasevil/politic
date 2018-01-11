class AddCiudadToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ciudad, :string
  end
end
