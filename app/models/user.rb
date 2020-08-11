class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :room_users
end
