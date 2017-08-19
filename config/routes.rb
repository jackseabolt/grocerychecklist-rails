Rails.application.routes.draw do
  root 'items#index'
  resources :items
  get "/items/checked/:id", to: "items#checked", as: 'checked'
  get "/items/counter", to: "items#counter", as: 'counter'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
