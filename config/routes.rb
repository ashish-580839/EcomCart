Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#index"

  resources :items, only: [:index]

  resources :line_items, only: [:create, :destroy]

  resources :carts, only: [:show]
end
