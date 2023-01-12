class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :no
      t.string :room_type
      t.text :description
      t.float :price
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
