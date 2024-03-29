class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :purchases

  with_options presence: true do
    validates :nickname
    zenkaku = /\A[ぁ-んァ-ン一-龥]/
    validates :last_name, format: { with: zenkaku, message: "は全角で入力してください。"}
    validates :first_name, format: { with: zenkaku, message: "は全角で入力してください。"}
    zenkaku_kana = /\A[ァ-ヶー－]+\z/
    validates :last_name_kana, format: { with: zenkaku_kana, message: "は全角カタカナで入力して下さい。"}
    validates :first_name_kana, format: { with: zenkaku_kana, message: "は全角カタカナで入力して下さい。"}
    validates :birthday
    end
  validate :password_complexity
end

def password_complexity
  return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/

  errors.add :password, 'Complexity requirement not met.'
end
