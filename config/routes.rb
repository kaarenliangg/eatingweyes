Rails.application.routes.draw do
  root :to => 'recipes#index'
  resources :users
  resources :categories
  resources :recipes
  resources :sessions
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/show'
  get 'categories/destroy'
  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/edit'
  get 'recipes/update'
  get 'recipes/show'
  get 'recipes/destroy'
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
