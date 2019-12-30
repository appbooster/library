class Book < ApplicationRecord
  has_many :book_reader_interactions
  has_many :active_book_reader_interactions, -> { where(returned_at: nil) }, class_name: "BookReaderInteraction"

  has_many :readers, through: :book_reader_interactions, source: :user
  has_many :current_readers, through: :active_book_reader_interactions, source: :user

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  has_many :reviews

  has_many :book_tag_joins
  has_many :tags, through: :book_tag_joins

  validates :title, :authors, presence: true
  validates :total_items_count, numericality: { only_integer: true, allow_nil: true }
  validates :available_items_count, numericality: { only_integer: true, allow_nil: true }

  def taken_by?(user)
    current_readers.pluck(:user_id).include?(user.id)
  end

  def awaited_by?(user)
    subscriptions.where(user: user).exists?
  end
end
