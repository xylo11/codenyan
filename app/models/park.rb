class Park < ApplicationRecord
  belongs_to :user
  has_many :park_users
  has_many :users, through: :park_users
  
  validates :name, presence: true
end