class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :authors, null: false
      t.string :description
      t.string :isbn_10
      t.string :isbn_13
      t.string :publisher
      t.string :cover_image
      t.integer :page_count

      t.timestamps
    end
  end
end
