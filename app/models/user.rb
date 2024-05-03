class User < ApplicationRecord
  has_one_attached :image
  validates :user_name, :email, presence: true
end
