class AddContenidoToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :contenido, :string
  end
end
