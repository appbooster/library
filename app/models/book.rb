class Book < ApplicationRecord
  validates :title, :authors, presence: true
  validates :total_items_count, numericality: { only_integer: true, allow_nil: true }
  validates :available_items_count, numericality: { only_integer: true, allow_nil: true }
end
