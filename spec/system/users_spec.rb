require 'rails_helper'

RSpec.feature "ユーザーログイン機能", type: :system do
  background do
    FactoryBot.create(:user)
  end

  it "ユーザーがログインできること" do
    visit new_user_session_path
    fill_in 'session[name]', with: 'テストユーザーa'
    fill_in 'session[email]', with: 'a@example.com'
    fill_in 'session[password]', with: 'aaaaaa'
    click_on 'Log in'
  end

  it "ユーザー登録が出来ること" do
    visit new_user_registration_path
    fill_in "user[user_name]", with: "テストユーザーa"
    fill_in "user[email]", with: "a@a.com"
    fill_in "user[password]", with: "aaaaaa"
    fill_in "user[password_confirmation]", with: "aaaaaa"
    click_on "signuo"
    expect(page).to have_content("マイページ")
  end

end
