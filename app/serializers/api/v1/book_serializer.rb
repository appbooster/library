class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :authors, :publisher, :description, :cover_image, :page_count
end
