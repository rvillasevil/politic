class AddFotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :foto, :string
  end
end
