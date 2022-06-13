class RemoveColunmsFromEvent < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :room_img, :string
  end
end
