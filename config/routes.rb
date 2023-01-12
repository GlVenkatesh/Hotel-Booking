Rails.application.routes.draw do
  root "home#index"
  get 'booking/index'
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  get 'admin/home'
  get 'admin/fix_history'
  get 'fix/index'
  get 'fix/new'
  get 'fix/index'
  post 'fix/create'
  get 'fix/new'
  devise_for :users
  get 'home/index'
  post 'home/index'
  get 'home/about'
  get 'home/contact'
  get 'home/select'
  get 'home/full_view'
  get 'home/checkout'
  post 'home/checkout'
  get "purchase_completed", to: "home#purchase_completed"
  post "checkout", to:"home#checkout"
  get 'home/search'
  post 'home/search'
  resources :rooms
  resources :hotels
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
