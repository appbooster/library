class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :book_tag_joins do |t|
      t.references :tag, foreign_key: true
      t.references :book, foreign_key: true
    end

    add_index :book_tag_joins, %i[tag_id book_id], unique: true
  end
end
