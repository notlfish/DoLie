require 'rails_helper'

RSpec.describe User, type: :model do
  def new_user(number)
    User.new(
      username: "User#{number}",
      full_name: "User #{number}",
      email: "user#{number}@example.com",
      password: '123456',
      password_confirmation: '123456'
    )
  end

  def new_opinion(user)
    user.opinions.create(text: '@User0 Using a good pillow is the best!')
  end

  def user_number(user)
    user.username.delete_prefix('User')
  end

  before(:each) do
    users = []
    6.times do |n|
      user = new_user(n)
      unless user.save
        puts 'Couldn\'t save user'
        p user
        p user.errors.full_messages
      end
      users.map { |existing_user| user.followeds << existing_user }
      users << user
      opinion = new_opinion(user)
      Mention.create_from_opinion(opinion)
    end
  end

  describe 'Associations' do
    it 'retrieves all opinions' do
      user = User.find_by(username: 'User1')
      expect(user.opinions.count).to eq(1)
    end

    it 'retrieves all followers' do
      user = User.find_by(username: 'User1')
      followers = user.followers.map { |follower| user_number(follower) }
      expect(followers).to eq(%w[2 3 4 5])
    end

    it 'retrieves all followeds' do
      user = User.find_by(username: 'User4')
      followeds = user.followeds.map { |followed| user_number(followed) }
      expect(followeds).to eq(%w[0 1 2 3])
    end

    it 'retrieves all mentions' do
      user = User.find_by(username: 'User0')
      expect(user.mentions.count).to eq(6)
    end
  end

  describe 'Instance methods' do
    it 'retrieves all the relevant opinions' do
      user = User.find_by(username: 'User4')
      opinions_from = user.relevant_opinions.pluck(:username)
      expect(opinions_from).to match_array(%w[User0 User1 User2 User3 User4])
    end

    it 'retrieves the relevant mention objects' do
      user = User.find_by(username: 'User0')
      mentioning_users = User.all.pluck(:username).to_a

      expect(user.relevant_mentions(max: 10).pluck(:username).to_a)
        .to match_array(mentioning_users)
    end
  end
end
