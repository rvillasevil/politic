class AddHashtag1ToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :hashtag1, :string
  end
end
