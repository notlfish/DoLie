require 'rails_helper'

RSpec.describe 'Feature tests' do
  before :each do
    users = []
    5.times do |n|
      user = User.create(username: "User#{n + 1}",
                         email: "user#{n + 1}@example.com",
                         full_name: "User#{n + 1}",
                         password: '123456',
                         password_confirmation: '123456')
      users[n + 1] = user
    end
    opinion = users[5].opinions.create(text: 'Hey there @User1')
    Mention.create_from_opinion(opinion)
  end

  def login_process(user_number: 1)
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'Username', with: "User#{user_number}"
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
  end

  def comment_with_user(user_number: 1,
                        text: 'A good pillow a day keeps the stiff neck at bay')
    login_process(user_number: user_number)
    fill_in 'opinion_text', with: text
    find('#opinion_text').native.send_keys(:return)
  end

  def log_out
    click_link 'Call it a day!'
  end

  describe 'Sign up process', type: :feature do
    it 'Signs up a user' do
      visit 'users/sign_up'
      within('#new_user') do
        fill_in 'Username', with: 'Alice'
        fill_in 'Full name', with: 'Alice McDream'
        fill_in 'Email', with: 'alice@example.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    it 'Fails to sign up with empty form' do
      visit 'users/sign_up'

      click_button 'Sign up'
      expect(page).to have_content "Username can't be blank"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end
  end

  describe 'log in process', type: :feature do
    it 'logs in' do
      login_process
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'fails to log in with empty fields' do
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'Username', with: ''
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Username or password.'
    end
  end

  describe 'log out process', type: :feature do
    it 'successfully logs out' do
      login_process
      log_out
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  describe 'write a rating', type: :feature do
    it 'successfully write a rating' do
      comment_with_user
      expect(page).to have_content 'A good pillow a day keeps'
    end

    it 'fails to register empty comment' do
      comment_with_user(text: '')
      expect(page).to have_content 'Text can\'t be blank'
    end

    it 'fails to register comment exceeding max comment length' do
      comment_with_user(text: 'a' * 251)
      expect(page).to have_content 'Text is too long (maximum is 250 characters)'
    end
  end

  describe 'registers a mention', type: :feature do
    it 'successfully registers a mention' do
      comment_with_user(user_number: 5, text: 'Sleep tight @User2')
      log_out
      login_process(user_number: 2)
      expect(page).to have_content 'Sleep tight @User2'
    end
  end
end
