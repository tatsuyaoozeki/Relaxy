require 'rails_helper'

RSpec.describe Menu, type: :model do

  it "menu_nameが空なら作成出来ない" do
    menu = Menu.new(name: '', content: '失敗テスト')
    expect(menu).not_to be_valid
  end

  it "time_requireが空なら作成出来ない" do
    menu = Menu.new(name: '失敗テスト', content: 'a', time_require: '')
    expect(menu).not_to be_valid
  end

  it "priceが空なら作成出来ない" do
    menu = Menu.new(name: '失敗テスト', content: 'a', price: '')
    expect(menu).not_to be_valid
  end

  it "menu_contentが空なら作成出来ない" do
    menu = Menu.new(name: '失敗テスト', content: 'a', menu_content: '')
    expect(menu).not_to be_valid
  end

  it "menu_name, time_require, price, menu_contentに内容が記載されていれば作成出来る" do
    menu = Menu.new(name: '成功テスト', content: '成功テスト')
    expect(menu).to be_valid
  end

end
