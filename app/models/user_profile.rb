class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :nickname, presence: true
  validate :avatar_size_and_format

  private

  def avatar_size_and_format
    return unless avatar.attached?

    errors.add(:avatar, 'is too big') if avatar.blob.byte_size > 1.megabytes
    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(avatar.blob.content_type)

    errors.add(:avatar, 'must be a JPEG or PNG')
  end
end
