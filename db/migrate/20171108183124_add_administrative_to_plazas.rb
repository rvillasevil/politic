class AddAdministrativeToPlazas < ActiveRecord::Migration[5.0]
  def change
    add_column :plazas, :administrative, :boolean
  end
end
