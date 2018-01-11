class AddAutonomiaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :autonomia, :string
  end
end
