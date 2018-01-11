class AddCreatedByToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :created_by, :integer
  end
end
