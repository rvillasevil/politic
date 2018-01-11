class AddProfesionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profesion, :string
  end
end
