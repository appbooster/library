class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :google_uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A\w+@appbooster.ru\z/, message: "Only appbooster members allowed" }
end
