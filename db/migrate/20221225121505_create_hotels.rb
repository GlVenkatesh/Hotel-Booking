class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :hotel_type
      t.text :address
      t.string :owner
      t.integer :contact
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
