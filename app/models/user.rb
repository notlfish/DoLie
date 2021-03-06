class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :full_name, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :photo, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :cover_image, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followings_er, class_name: 'Following',
                           foreign_key: 'follower_id', dependent: :destroy
  has_many :followeds, through: :followings_er, source: :followed

  has_many :followings_ed, class_name: 'Following',
                           foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :followings_ed, source: :follower

  has_many :mentions

  scope :who_to_follow, -> { all.order('id DESC').limit(3) }

  def relevant_opinions(from: :homepage, max: 10)
    ids = from == :homepage ? followeds.pluck(:id) << id : id
    Opinion.joins(:author)
      .select('users.username as username, users.photo as photo, opinions.text')
      .where(author_id: ids).order(created_at: :desc).limit(max)
  end

  def relevant_mentions(max: 5)
    ids = mentions.pluck(:opinion_id)
    Opinion.joins(:author)
      .select('users.username as username, users.photo as photo, opinions.text')
      .where(id: ids).order(created_at: :desc).limit(max)
  end

  def follows?(user)
    (followeds.pluck(:id) << id).include?(user.id)
  end
end
