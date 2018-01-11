class CreateProvincia < ActiveRecord::Migration[5.0]
  def change
    create_table :provincia do |t|
      t.integer :id_provincia
      t.string :provincia

      t.timestamps
    end
  end
end
