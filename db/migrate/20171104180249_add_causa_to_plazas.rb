class AddCausaToPlazas < ActiveRecord::Migration[5.0]
  def change
    add_column :plazas, :causa, :boolean
  end
end
