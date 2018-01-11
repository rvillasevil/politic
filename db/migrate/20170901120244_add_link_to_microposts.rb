class AddLinkToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :link, :string
  end
end
