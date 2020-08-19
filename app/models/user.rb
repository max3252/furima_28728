class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :nickname,
            presence: true

  validates :password,
            confirmation: true,
            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  validates :birth_day,
            presence: true

  has_many :items

end
