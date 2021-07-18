class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :full_name, presence: true
  validates :password_confirmation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :photo, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :cover_image, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followings_er, class_name: 'Following',
           foreign_key: 'follower_id', dependent: :destroy
  has_many :followeds, through: :followings_er, source: :followed

  has_many :followings_ed, class_name: 'Following',
           foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :followings_ed, source: :follower
end
