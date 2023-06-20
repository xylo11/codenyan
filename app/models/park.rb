class Park < ApplicationRecord
  has_many :park_users
  has_many :users, through: :park_users
  # has_many :posts
end