require 'rails_helper'

RSpec.feature "ユーザーログイン機能", type: :system do
  background do
    FactoryBot.create(:user)
  end

  it "ユーザーがログインできること" do
    visit new_user_session_path
    fill_in 'user[email]', with: 'a@example.com'
    fill_in "user_password", with: 'aaaaaa'
    click_on 'commit'

    expect(page).to have_content("ユーザー情報")
  end

  it "ユーザー登録が出来ること" do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'テストユーザーb'
    fill_in 'user[email]', with: 'b@example.com'
    fill_in "user_password", with: 'bbbbbb'
    fill_in "user_password_confirmation", with: "bbbbbb"
    click_on 'commit'
    expect(page).to have_content("ユーザー情報")
  end
end
