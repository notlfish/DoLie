require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before(:each) do
    User.create(username: 'User11',
                full_name: 'User 11',
                email: 'user11@example.com',
                password: '123456',
                password_confirmation: '123456')
  end

  describe 'Validations' do
    it 'validates opinion text nonempty' do
      opinion = User.find_by(username: 'User11').opinions.build(text: '')

      expect(opinion.valid?).to be(false)
    end

    it 'validates opinion text length' do
      opinion = User.find_by(username: 'User11').opinions.build(text: 'a' * 255)

      expect(opinion.valid?).to be(false)
    end

    it 'allows valid opinions' do
      opinion = User.find_by(username: 'User11').opinions
        .build(text: 'A good mattress is not a luxury')

      expect(opinion.valid?).to be(true)
    end
  end
end
