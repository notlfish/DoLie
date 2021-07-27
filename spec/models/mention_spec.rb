require 'rails_helper'

RSpec.describe Mention, type: :model do
  describe 'Mentions get correctly created from an opinion' do
    before(:each) do
      text = ''
      5.times do |n|
        username = "user#{n}"
        text += "@#{username} "
        User.create(username: username,
                    full_name: username,
                    email: "#{username}@example.com",
                    password: '123456',
                    password_confirmation: '123456')
      end
      User.find_by(username: 'user4').opinions << Opinion.create(text: text)
    end

    it 'Correctly create mentions' do
      user4 = User.find_by(username: 'user4')
      Mention.create_from_opinion(Opinion.find_by(author_id: user4.id))

      mentioned_users = %w[user0 user1 user2 user3 user4]
      fetched_mentioned_users = User.where(id: Mention.all.pluck(:user_id))
        .pluck(:username)

      expect(fetched_mentioned_users).to match_array(mentioned_users)
    end

    it 'Ignores invalid user names' do
      user4 = User.find_by(username: 'user4')
      opinion = user4.opinions.create(text: '@non_existing_user')
      Mention.create_from_opinion(opinion)

      fetched_mentions = Mention.where(opinion_id: opinion.id)

      expect(fetched_mentions.empty?).to be(true)
    end
  end
end
