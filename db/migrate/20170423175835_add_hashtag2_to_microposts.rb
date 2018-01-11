class AddHashtag2ToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :hashtag2, :string
  end
end
