# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「メニュー管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "メニュー管理機能", type: :feature do
  background do
    @user = FactoryBot.create(:user)
    FactoryBot.create(:menu, user_id: @user.id)
    FactoryBot.create(:second_menu, user_id: @user.id)
    FactoryBot.create(:third_menu, user_id: @user.id)
    visit new_user_session_path
    fill_in 'session[email]', with: 'j@example.com'
    fill_in 'session[password]', with: 'aaaaaa'
    click_button 'Log in'
  end

  scenario "メニュー一覧のテスト" do
    visit menus_path

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "メニュー作成のテスト" do
    visit new_menu_path

    fill_in 'メニュー名', with: 'Factoryで作ったデフォルトのタイトル１'
    fill_in 'メニュー詳細', with: 'Factoryで作ったデフォルトのコンテント１'
    click_on '登録する'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "メニュー詳細のテスト" do
    # menu.create!(name: 'Factoryで作ったデフォルトのタイトル１', content: 'Factoryで作ったデフォルトのコンテント１', deadline: '2019.09.20.11.11')
    visit menus_path
    page.first("#show").click
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end
end
