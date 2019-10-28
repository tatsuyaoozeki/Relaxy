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

  resources :users, only: [:show] do
    resources :staffs
  end
  resources :relationships, only: [:create, :destroy]

  resources :menus do
    resources :reservations do
      collection do
        post :confirm
      end
    end
  end
  # get 'reservations/index'
  # get 'menus/index'
  resources 'feeds' do
    collection do
      post :confirm
    end
  end

  get 'users/show'
  root 'home#index'
  post 'users/:user_id/staffs/:id', to: 'staffs#show'
end
