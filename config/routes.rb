Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'questions#index'
  resources :users
  post 'users/guest_login', to: 'users#guest_login'
  resources :questions, only: %i[index show new create destroy] do
    resources :answers, only: %i[create]
  end
  namespace :admin do
    get 'login', to: 'sessions#new'
    resources :questions, only: %i[index show create edit destroy]
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
