# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「投稿管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "投稿管理機能", type: :feature do
  background do
    @user = FactoryBot.create(:user)
    FactoryBot.create(:feed, user_id: @user.id)
    FactoryBot.create(:second_feed, user_id: @user.id)
    FactoryBot.create(:third_feed, user_id: @user.id)
    visit new_user_session_path
    fill_in 'session[name]', with: 'ユーザーa'
    fill_in 'session[email]', with: 'a@example.com'
    fill_in 'session[password]', with: 'aaaaaa'
    click_button 'Log in'
  end

  scenario "投稿一覧のテスト" do
    visit feeds_path

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "投稿詳細のテスト" do
    # feed.create!(name: 'Factoryで作ったデフォルトのタイトル１', content: 'Factoryで作ったデフォルトのコンテント１', deadline: '2019.09.20.11.11')
    visit feeds_path
    page.first("#show").click
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end
end
