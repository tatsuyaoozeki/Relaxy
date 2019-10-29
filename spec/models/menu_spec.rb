require 'rails_helper'

RSpec.describe Menu, type: :model do

  it "menu_nameが空ならバリデーションが通らない" do
    menu = Menu.new(name: '', content: '失敗テスト')
    expect(menu).not_to be_valid
  end

  it "time_requireが空ならバリデーションが通らない" do
    menu = Menu.new(name: '失敗テスト', content: '')
    expect(menu).not_to be_valid
  end

  it "priceが空ならバリデーションが通らない" do
    menu = Menu.new(name: '失敗テスト', content: '')
    expect(menu).not_to be_valid
  end

  it "menu_contentが空ならバリデーションが通らない" do
    menu = Menu.new(name: '失敗テスト', content: '')
    expect(menu).not_to be_valid
  end

  it "menu_name, time_require, price, menu_contentに内容が記載されていればバリデーションが通る" do
    menu = Menu.new(name: '成功テスト', content: '成功テスト')
    expect(menu).to be_valid
  end

end
