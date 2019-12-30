require "csv"

class ImportBooks < ActiveRecord::Migration[6.0]
  SOURCE_FILE_PATH = "./books.csv"

  def up
    CSV.open(File.expand_path(SOURCE_FILE_PATH, __dir__), headers: false).each do |row|
      isbn, tags_str = row
      search = Book::SearchByIsbn.new.call(isbn)
      next unless search[:found]

      create_book!(search[:result], tags_str)
      sleep(0.5)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private

  def create_book!(attrs, tags_str)
    book = Book.new(attrs)
    book.transaction do
      book.save!
      tags_ids = tags_ids_from_string(tags_str)
      tags_ids.map { |tag_id| book.book_tag_joins.create!(tag_id: tag_id) }
    end
  end

  def tags_ids_from_string(str)
    keys = str.split(",").map(&:chomp)
    tags.values_at(*keys)
  end

  def tags
    @tags = Tag.all.each_with_object({}) { |tag, obj| obj[tag.name.to_s] = tag.id }
  end
end
