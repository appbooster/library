class Book < ApplicationRecord
  validates :title, :authors, presence: true
end
