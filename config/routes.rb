Rails.application.routes.draw do
  resources :blogs
  resources :comments
  resources :users

  get "/auth",to: "users#show"
  post "/login",to: "sessions#create"
  delete "/logout",to: "sessions#destroy"

end
