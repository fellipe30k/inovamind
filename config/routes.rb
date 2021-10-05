Rails.application.routes.draw do
  resources :quotes
  devise_for :users
  resources :quote_searches
  resources :users
  post "authenticate", to: "authentication#authenticate"
  get :quotes, to: "quotes#index"
end
