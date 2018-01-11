class CreatePueblos < ActiveRecord::Migration[5.0]
  def change
    create_table :pueblos do |t|
      t.integer :id_provincia
      t.integer :cod_municipio
      t.integer :DC
      t.string :nombre
      
      t.timestamps
    end
  end
end
