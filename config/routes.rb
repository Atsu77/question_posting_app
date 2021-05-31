Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users
  resources :questions, only: %i[index show new create destroy] do
    resources :answers, only: %i[create]
  end
  namespace :admin do
    resources :questions, only: %i[index show create edit destroy]
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
