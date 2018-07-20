Rails.application.routes.draw do
  devise_for :users, skip: [:passwords, :registrations], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'mastodon_login#index'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :users, only: [:show]
  resources :name_cards
  resources :received_cards, only: [:index, :create, :destroy]
end
