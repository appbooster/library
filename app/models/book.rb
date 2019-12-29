class Book < ApplicationRecord
  has_many :book_reader_interactions
  has_many :readers, through: :book_reader_interactions, source: :user
  has_many :current_readers, -> { where("book_reader_interactions.returned_at IS NULL") },
           through: :book_reader_interactions, source: :user

  validates :title, :authors, presence: true
  validates :total_items_count, numericality: { only_integer: true, allow_nil: true }
  validates :available_items_count, numericality: { only_integer: true, allow_nil: true }

  def taken_by?(user)
    current_readers.pluck(:user_id).include?(user.id)
  end
end
