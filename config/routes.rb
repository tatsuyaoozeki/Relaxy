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

  resources :users, only: [:show]
  resources :staffs
  resources :menus do
    resources :reservations
  end
end
