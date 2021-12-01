Rails.application.routes.draw do
  resources :currencies
  resources :commodities
  resources :exchanges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
