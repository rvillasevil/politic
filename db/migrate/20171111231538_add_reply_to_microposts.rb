class AddReplyToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :reply, :integer
  end
end
