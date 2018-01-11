class CreateMunicipios < ActiveRecord::Migration[5.0]
  def change
    create_table :municipios do |t|
      t.integer :provincia_id
      t.integer :municipio_id
      t.integer :codmunicipio
      t.string :nombre

      t.timestamps
    end
  end
end
