class CreateEstados < ActiveRecord::Migration[5.0]
  def change
    create_table :estados do |t|
      t.integer :ubicacionpaisid
      t.string :estadonombre

      t.timestamps
    end
  end
end
