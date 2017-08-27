n = 1
while n <= 100
  Blog.create(
    title: "あああ",
    content: "hoge",
    user_id: n
  )
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
  n = n + 1
end