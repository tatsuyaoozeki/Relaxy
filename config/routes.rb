Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  devise_scope :users do
    get "user/:id", to: "users/registrations#detail"
    get "signup", to: "users/registrations#new"
    get "signout", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end

  root 'home#index'
  # post 'users/:user_id/staffs/:id', to: 'staffs#show'

  resources :feeds
  resources :relationships, only: [:create, :destroy]

  resources :users, only:[:show] do
    member do
     get :following, :followers
    end
  end

  resources :staffs
  resources :menus do
    resources :reservations#, only: [:new, :create, :show, :destroy]
  end
end
