class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :authors, :publisher, :description, :cover_image, :page_count,
             :total_items_count, :available_items_count

  has_many :active_book_reader_interactions, key: :current_readers, serializer: Api::V1::BookReaderSerializer
end
