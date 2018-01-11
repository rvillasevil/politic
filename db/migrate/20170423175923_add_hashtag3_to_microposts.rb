class AddHashtag3ToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :hashtag3, :string
  end
end
