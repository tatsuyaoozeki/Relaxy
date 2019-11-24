require 'rails_helper'

RSpec.describe Menu, type: :model do

  it "titleが空ならバリデーションが通らない" do
    menu = Menu.new(title: '', content: '失敗テスト', image: '失敗テスト', user_id: '失敗テスト')
    expect(menu).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    menu = Menu.new(title: '', content: '', image: '失敗テスト', user_id: '失敗テスト' )
    expect(menu).not_to be_valid
  end

  it "image空ならバリデーションが通らない" do
    menu = Menu.new(title: '失敗テスト', content: '失敗テスト', image: '', user_id: '失敗テスト' )
    expect(menu).not_to be_valid
  end
end
