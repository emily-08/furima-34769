class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :password, confirmation: true, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: '半角英数字混合で入力してください' }
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ)でを入力してください' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角(カタカナ)のみで入力して下さい' } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end