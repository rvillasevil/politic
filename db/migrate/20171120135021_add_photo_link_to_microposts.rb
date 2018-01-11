class AddPhotoLinkToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :photo_link, :string
  end
end
