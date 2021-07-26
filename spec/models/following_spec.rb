require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    2.times do |n|
      User.create(username: "User#{n + 1}",
                  full_name: "User #{n + 1}",
                  email: "user#{n + 1}@example.com",
                  password: '123456',
                  password_confirmation: '123456')
    end
  end

  describe 'Validations' do
    it 'validates that a user can only follow another user once' do
      user1 = User.find_by(username: 'User1')
      user2 = User.find_by(username: 'User2')
      user1.followeds << user2
      following = Following.new(follower_id: user1.id, followed_id: user2.id)

      expect(following.valid?).to be(false)
    end

    it 'allows mutual following' do
      user1 = User.find_by(username: 'User1')
      user2 = User.find_by(username: 'User2')
      user1.followeds << user2
      following = Following.new(follower_id: user2.id, followed_id: user1.id)

      expect(following.valid?).to be(true)
    end
  end
end
