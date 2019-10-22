Rails.application.routes.draw do
  get 'staffs/index'
  get 'users/show'
  get 'home/index'
  get 'home/mypage'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
end
