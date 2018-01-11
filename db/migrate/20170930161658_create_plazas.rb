class CreatePlazas < ActiveRecord::Migration[5.0]
  def change
    create_table :plazas do |t|
      t.string :name
      t.string :ciudad
      t.string :foto
      t.integer :user_id

      t.timestamps
    end
  end
end
