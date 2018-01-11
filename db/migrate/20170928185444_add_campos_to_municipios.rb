class AddCamposToMunicipios < ActiveRecord::Migration[5.0]
  def change
  	add_column :municipios, :id_provincia, 		:integer
  	add_column :municipios, :cod_municipio, 	:integer
  	add_column :municipios, :DC, 							:integer
  end
end
