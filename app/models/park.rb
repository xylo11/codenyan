class Park < ApplicationRecord
  has_many :park_users, dependent: :destroy
  has_many :users, through: :park_users
  has_many :posts, dependent: :destroy

  validates :name, presence: true
end