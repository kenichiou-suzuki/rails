class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  
#パスワードをアルファベット、数字の混合のみ可
  validates :password, format: { with: VALID_PASSWORD_REGEX}
#８〜３２文字制限
  validates :password, length: { minimum: 8, maximum: 32}
  
#メールアドレスの正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}
  
#15文字まで許可するようにバリデーションを設定
  validates :name, length: { maximum: 15}
  
  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
