class CreatePais < ActiveRecord::Migration[5.0]
  def change
    create_table :pais do |t|
      t.string :paisnombre

      t.timestamps
    end
  end
end
