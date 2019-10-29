require 'rails_helper'

RSpec.describe Feed, type: :model do

  it "titleが空ならバリデーションが通らない" do
    feed = Feed.new(name: '', content: '失敗テスト')
    expect(feed).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    feed = Feed.new(name: '失敗テスト', content: '')
    expect(feed).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    feed = Feed.new(name: '成功テスト', content: '成功テスト')
    expect(feed).to be_valid
  end
end
