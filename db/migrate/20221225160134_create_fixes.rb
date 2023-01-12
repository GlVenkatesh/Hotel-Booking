class CreateFixes < ActiveRecord::Migration[6.0]
  def change
    create_table :fixes do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
