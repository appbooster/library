class User < ApplicationRecord
  has_many :book_reader_interactions
  has_many :books, through: :book_reader_interactions

  has_many :reviews

  # Does not work on Heroku
  # https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku
  # mount_uploader :avatar, AvatarUploader

  validates :google_uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A\w+@appbooster.ru\z/, message: "Only appbooster members allowed" }
end
