class AddActionToPlazas < ActiveRecord::Migration[5.0]
  def change
    add_column :plazas, :action, :boolean
  end
end
