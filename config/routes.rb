Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:edit, :show]

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
