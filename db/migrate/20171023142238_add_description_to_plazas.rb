class AddDescriptionToPlazas < ActiveRecord::Migration[5.0]
  def change
    add_column :plazas, :description, :string
  end
end
