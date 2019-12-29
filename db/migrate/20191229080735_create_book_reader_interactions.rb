class CreateBookReaderInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :book_reader_interactions do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :taken_at
      t.datetime :returned_at
    end
  end
end
