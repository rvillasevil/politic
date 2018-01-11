class AddTitleLinkToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :title_link, :string
  end
end
