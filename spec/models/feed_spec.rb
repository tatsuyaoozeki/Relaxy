require 'rails_helper'

RSpec.describe Feed, type: :model do

  it "nameが空なら作成出来ない" do
    feed = Feed.new(title: '', content: '失敗テスト')
    expect(feed).not_to be_valid
  end

  it "contentが空なら作成出来ない" do
    feed = Feed.new(title: '失敗テスト', content: '')
    expect(feed).not_to be_valid
  end

end
