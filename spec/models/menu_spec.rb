require 'rails_helper'

RSpec.describe Menu, type: :model do


  it "menu_nameが空ならバリデーションが通らない" do
    menu = Menu.new(menu_name: '', time_require: '失敗テスト',price: '失敗テスト', menu_content: '失敗テスト', user_id: '失敗テスト')
    expect(menu).not_to be_valid
  end

  it "time_requireが空ならバリデーションが通らない" do
    menu = Menu.new(menu_name: '', time_require: '',price: '失敗テスト', menu_content: '失敗テスト', user_id: '失敗テスト' )
    expect(menu).not_to be_valid
  end

  it "priceが空ならバリデーションが通らない" do
    menu = Menu.new(menu_name: '失敗テスト', time_require: '失敗テスト',price: '', menu_content: '失敗テスト', user_id: '失敗テスト' )
    expect(menu).not_to be_valid
  end

  it "menu_contentが空ならバリデーションが通らない" do
    menu = Menu.new(menu_name: '', time_require: '失敗テスト',price: '失敗テスト', menu_content: '', user_id: '失敗テスト' )
    expect(menu).not_to be_valid
  end

  # it "user_idが空ならバリデーションが通らない" do
  #   menu = Menu.new(menu_name: '', time_require: '失敗テスト',price: '失敗テスト', menu_content: '失敗テスト', user_id: "")
  #   expect(menu).not_to be_valid
  # end


  # it "menu_name, time_require, price, menu_contentに内容が記載されていればバリデーションが通る" do
  #   menu = Menu.new(menu_name: 'テスト成功', time_require: 'テスト成功',  price: 'テスト成功', menu_content: 'テスト成功')
  #
  #   expect(menu).to be_valid
  # end

end
