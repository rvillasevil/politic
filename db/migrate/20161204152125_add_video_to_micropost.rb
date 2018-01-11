class AddVideoToMicropost < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :video, :string
  end
end
