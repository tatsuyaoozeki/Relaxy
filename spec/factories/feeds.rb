# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「feed」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :feed do
    title { 'Factoryで作ったデフォルトのタイトル1' }
    content { 'Factoryで作ったデフォルトのコンテント1' }
    image { 'Factoryで作ったデフォルトのコンテント1' }
    user_id {1}
    user
  end

  # 作成するテストデータの名前を「second_feed」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_feed, class: Feed do
    title { 'Factoryで作ったデフォルトのタイトル2' }
    content { 'Factoryで作ったデフォルトのコンテント2' }
    image { 'Factoryで作ったデフォルトのimage2' }
    user_id {2}
    user
  end

  factory :third_feed, class: Feed do
    title { 'Factoryで作ったデフォルトのタイトル3' }
    content { 'Factoryで作ったデフォルトのコンテント3' }
    image { 'Factoryで作ったデフォルトのimage3' }
    user_id {3}
    user
  end
end
