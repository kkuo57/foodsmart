class AddFoodIdToListEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :list_entries, :food_id, :integer
  end
end
