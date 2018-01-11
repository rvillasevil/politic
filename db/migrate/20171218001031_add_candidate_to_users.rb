class AddCandidateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :candidate, :boolean
  end
end
