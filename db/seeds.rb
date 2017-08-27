n = 1
email = Faker::Internet.email
password = "password"
while n <= 100
  Blog.create(
    title: "あああ",
    content: "hoge",
    user_id: n
  )
   User.create(
     email: email,
     password: password,
     password_confirmation: password,
     user_id: n
  )
  n = n + 1
end