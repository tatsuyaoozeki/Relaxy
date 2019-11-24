FactoryBot.define do
  factory :feed do
    title { 'タイトル' }
    content { '投稿内容'}
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/rspec_test.png')) }
    user
  end
end
