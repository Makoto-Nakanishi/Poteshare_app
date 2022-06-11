class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :room_name, null: false
      t.text :content, null: false
      t.integer :price, null: false
      t.string :address, null: false
      t.binary :room_img, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
