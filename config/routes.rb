Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#home'
  
  resources :users, :only => [:new, :create]
  resources :firearms
  resources :ammos
  resources :manufacturers, :only => [:index, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#delete'

end