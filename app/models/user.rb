class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: { message: 'を入力してください' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }

  has_one :user_profile, dependent: :destroy

  after_create :create_user_profile

  private

  def create_user_profile
    self.create_user_profile!(nickname: self.username)
  end
  
end
