Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  resources :blogs
  resources :comments
  resources :users

  get "/auth",to: "users#current_user"
  post "/login",to: "sessions#create"
  delete "/logout",to: "sessions#destroy"

end
