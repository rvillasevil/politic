class AddSeguidoresToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :seguidores, :integer, default: 0
  end
end
