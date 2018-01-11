class RemoveSeguidoresFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :seguidores, :integer
  end
end
