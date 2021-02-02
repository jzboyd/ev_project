Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/ev', to: 'ev#index'
  get '/ev/:id', to: 'ev#show'
  post 'ev/', to: 'ev#create'
  delete '/ev/:id', to: 'ev#delete'
  put '/ev/:id', to: 'ev#update'
end
