class AddItemsCountToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :total_items_count, :integer, default: 1, null: false
    add_column :books, :available_items_count, :integer, default: 1, null: false
  end
end
