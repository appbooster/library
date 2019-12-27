class User < ApplicationRecord
  # Does not work on Heroku
  # https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku
  # mount_uploader :avatar, AvatarUploader

  validates :google_uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A\w+@appbooster.ru\z/, message: "Only appbooster members allowed" }
end
