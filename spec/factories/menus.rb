# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「menu」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :menu do
    menu_name { 'Factoryで作ったデフォルトのメニュー名１' }
    time_require { 'Factoryで作ったデフォルトの施術時間１' }
    price { '60'}
    menu_content { "Factoryで作ったデフォルトのメニュー内容1" }
    user_id {1}
    user
  end

  # 作成するテストデータの名前を「second_menu」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_menu, class: Menu do
    menu_name { 'Factoryで作ったデフォルトのメニュー名2' }
    time_require { 'Factoryで作ったデフォルトの施術時間2' }
    price { '60'}
    menu_content { "Factoryで作ったデフォルトのメニュー内容2" }
    user_id {2}
    user
  end

  factory :third_menu, class: Menu do
    menu_name { 'Factoryで作ったデフォルトのメニュー名3' }
    time_require { 'Factoryで作ったデフォルトの施術時間3' }
    price { '60'}
    menu_content { "Factoryで作ったデフォルトのメニュー内容3" }
    user_id {3}
    user
  end
end
