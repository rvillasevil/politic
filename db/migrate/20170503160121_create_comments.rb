class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.string :content_string

      t.timestamps
    end
  end
end
