Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"

  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
