Rails.application.routes.draw do
  delete '/exchanges/special_delete', to: "exchanges#special_destroy"

  resources :currencies
  resources :commodities
  resources :exchanges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
