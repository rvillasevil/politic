class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :micropost_id
      t.integer :user_id
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
