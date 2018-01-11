class AddPlazaIdToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :plaza_id, :integer
  end
end
