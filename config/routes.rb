Rails.application.routes.draw do
  devise_for :users, skip: [:passwords, :registrations], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'mastodon_login#index'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/apple-touch-icon-120x120-precomposed.png', to: 'static_pages#apple_touch_icon'
  get  '/apple-touch-icon-120x120.png', to: 'static_pages#apple_touch_icon'
  get  '/apple-touch-icon-precomposed.png', to: 'static_pages#apple_touch_icon'
  get  '/apple-touch-icon.png', to: 'static_pages#apple_touch_icon'
  resources :users, only: [:show]
  resources :name_cards
  resources :received_cards, only: [:index, :create, :destroy]
end
