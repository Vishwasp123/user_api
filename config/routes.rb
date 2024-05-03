# config/routes.rb
Rails.application.routes.draw do
  resources :users
  # post '/update_user', to: 'users#update_user'
  post "/users", to: "users#create"
  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  post '/update/:token', to: 'users#update', as: 'update'
  get '/update_user', to: 'users#update', as: 'update_user'
   get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

end
