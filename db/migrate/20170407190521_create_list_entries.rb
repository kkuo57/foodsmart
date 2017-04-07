class CreateListEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :list_entries do |t|
      t.string :quantity
      t.string :food_name
      t.integer :list_id

      t.timestamps
    end
  end
end
