class AddComunidadIdToProvincia < ActiveRecord::Migration[5.0]
  def change
    add_column :provincia, :comunidad_id, :integer
  end
end
