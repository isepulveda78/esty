Rails.application.routes.draw do

  devise_for :users
  resources :listings do
    resources :orders, only: [:new, :create]
  end

  resources :charges
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => 'listings#seller'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
  get 'sales' => 'orders#sales'
  get 'purchases' => 'orders#purchases'
end
