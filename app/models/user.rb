class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}
       
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' }, length: { minimum: 6 }, confirmation: true do
   validates :password
  end

  validates_format_of :first_name, with: /\A[ぁ-んァ-ン一-龥]/
  validates_format_of :last_name, with: /\A[ぁ-んァ-ン一-龥]/
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates_format_of :last_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates :birth, presence: true
end