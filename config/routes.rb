Rails.application.routes.draw do
  root :to => 'recipes#index'
  resources :users
  resources :categories
  resources :recipes
  resources :sessions
 
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


  get 'users/index'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
