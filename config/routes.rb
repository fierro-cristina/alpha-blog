Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  # The following line represents ALL the routes for articles
  # These routes are called REST - Representational state transfer, mapping HTTP
  # verbs (get, post, put/patch, delete) to CRUD actions.
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  #The preceeding line can be replaced as follows:
  resources :articles

  get "signup", to: "users#new"
  resources :users, except: [:new]
end
