class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :plaza_id
      t.integer :user_id

      t.timestamps
    end
  end
end
