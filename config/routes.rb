Rails.application.routes.draw do
  devise_for :users
  root "portfolios#index"
  resources :portfolios
  root to: "statuses#index"
  #root to: 'pages#main'
  #root 'pages#main'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
