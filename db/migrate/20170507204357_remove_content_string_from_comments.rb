class RemoveContentStringFromComments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :comments, :content_string, :string
  end
end
