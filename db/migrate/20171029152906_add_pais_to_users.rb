class AddPaisToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pais, :string
  end
end
