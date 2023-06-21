class Post < ApplicationRecord
  belongs_to :user
  belongs_to :park

  validates :title, presence: true
  validates :content, presence: true
  validates :park, presence: true

  has_many_attached :images
end