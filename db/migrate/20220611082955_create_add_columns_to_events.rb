class CreateAddColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :add_columns_to_events do |t|
      t.string :r_img

      t.timestamps
    end
  end
end
