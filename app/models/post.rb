class Post < ApplicationRecord
  belongs_to :user
  belongs_to :park
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :park, presence: true

  has_many_attached :images
end