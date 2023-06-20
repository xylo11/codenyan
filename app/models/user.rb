class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: { message: 'を入力してください' }, uniqueness: { case_sensitive: true, message: 'は既に存在します' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }

  has_one :user_profile, dependent: :destroy
  after_create :create_user_profile
  has_many :park_users
  has_many :parks, through: :park_users
  has_many :created_parks, class_name: 'Park', foreign_key: 'user_id'

  private

  def create_user_profile
    create_user_profile!(nickname: username)
  end
end
