require 'rails_helper'

RSpec.describe Feed, type: :feed do

  it "titleが空ならバリデーションが通らない" do
    feed = Feed.new(title: '', content: '失敗テスト', image: '失敗テスト', user_id: '失敗テスト')
    expect(feed).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    feed = Feed.new(title: '', content: '', image: '失敗テスト', user_id: '失敗テスト' )
    expect(feed).not_to be_valid
  end

  it "image空ならバリデーションが通らない" do
    feed = Feed.new(title: '失敗テスト', content: '失敗テスト', image: '', user_id: '失敗テスト' )
    expect(feed).not_to be_valid
  end
end
