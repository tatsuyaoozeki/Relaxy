# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |index|
  a = index + 1
  user = User.create(
    name:           "テストユーザー#{a}",
    email:  "#{a}@example.com",
    password:               "#{a}password#{a}",
    password_confirmation:  "#{a}password#{a}",
    status: "スタッフ"
  )
end

20.times do |index|
  b = index + 20
  user = User.create(
    name:           "テストユーザー#{b}",
    email:  "#{b}@example.com",
    password:               "#{b}password#{b}",
    password_confirmation:  "#{b}password#{b}",
    status: "一般ユーザー"
  )
end

20.times do |index|
  c = index + 1
  staff = Staff.create(
    user_id: "#{c}",
    content: "#{c}aaaaa#{c}",
    gender: '男性'
  )
end


# Staff.create(
#   user_id: 1,
#
# )


# 20.times do |i|
#   Menu.create(
#     user_id: 1,
#     menu_name: "テストメニュー#{i}",
#     time_require: 60,
#     price: 1000,
#     menu_content: "テストメニューコンテント#{i}"
#   )
# end



# User.create(
#   name: 'テストユーザーa',
#   email: 'a@a.com',
#   password: 'aaaaaa',
#   status: true,
# )
#
#
# User.create(
#   name: 'テストユーザーb',
#   email: 'b@b.com',
#   password: 'aaaaaa'
# )
