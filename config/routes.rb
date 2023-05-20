Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  resources :blogs do
    resources :comments
  end
  resources :comments
  resources :users do
    resources :blogs
  end


  get "/auth",to: "users#current_user"
  post "/login",to: "sessions#create"
  delete "/logout",to: "sessions#destroy"

end
