class CreateComunidads < ActiveRecord::Migration[5.0]
  def change
    create_table :comunidads do |t|
      t.string :comunidad
      t.integer :capital_id

      t.timestamps
    end
  end
end
