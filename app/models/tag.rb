class Tag < ApplicationRecord
  has_many :book_tag_joins
  has_many :books, through: :book_tag_joins
end
