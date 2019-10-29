FactoryBot.define do
  factory :user, class: User do
    name { "テストユーザーa" }
    email { "a@example.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
  end
end
