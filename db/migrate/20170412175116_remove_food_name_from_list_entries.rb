class RemoveFoodNameFromListEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column :list_entries, :food_name, :string
  end
end
