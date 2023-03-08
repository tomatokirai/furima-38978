class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_records

  validates :nickname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'を入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: '' }
  validates :birth_day, presence: true
end
