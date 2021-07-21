def populate_users(number_of_users)
  (1..number_of_users + 1).each do |n|
    User.create(
      username: "User#{n}",
      email: "user#{n}@example.com",
      full_name: "User #{n} Pérez",
      password: '123456',
      password_confirmation: '123456'
    )
  end
end

def populate_user_followers_and_opinions(number_of_users)
  (1..number_of_users + 1).each do |n|
    user = User.find(n)
    user.opinions.create(text: 'My pillow could be better: 7/10')
    (1..n - 1).each do |m|
      user.followeds << User.find(m)
    end
  end
end

populate_users(5)
populate_user_followers_and_opinions(5)
