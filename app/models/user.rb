class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
       
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' }, length: { minimum: 6 }, confirmation: true do
   validates :password
  end

  with_options presence: true do
    validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates_format_of :last_name, with: /\A[ぁ-んァ-ン一-龥]+\z/
    validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/
    validates_format_of :last_name_kana, with: /\A[ァ-ヶー－]+\z/
  end

  validates :birth, presence: true

end