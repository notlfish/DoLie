class Mention < ApplicationRecord
  belongs_to :opinion
  belongs_to :user

  def self.create_from_opinion(opinion)
    mentioned_users_usernames = Mention.parse_mentions(opinion.text)
    mentioned_users = User.where(username: mentioned_users_usernames)

    mentioned_users.each do |user|
      Mention.create(opinion_id: opinion.id, user_id: user.id)
    end
  end

  private

  def self.parse_mentions(str)
    str.scan(/\@\w+/).map { |str| str[1..-1] }
  end
end
