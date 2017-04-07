class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :user_id
      t.boolean :isFavorite

      t.timestamps
    end
  end
end
