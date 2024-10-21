Rails.application.routes.draw do
  post '/register', to: 'auth#register'
  post '/login', to: 'auth#login'

  resources :expenditures, only: [:index, :create, :update, :destroy]
end
