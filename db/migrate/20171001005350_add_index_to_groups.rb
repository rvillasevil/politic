class AddIndexToGroups < ActiveRecord::Migration[5.0]
  def change
  	add_index :groups, :user_id
    add_index :groups, :plaza_id
    add_index :groups, [:user_id, :plaza_id], unique: true
  end
end
