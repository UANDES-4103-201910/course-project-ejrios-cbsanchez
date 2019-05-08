Rails.application.routes.draw do
  resources :users
  resources :dump_lists
  resources :black_lists
  resources :user_profiles
  resources :commentaries
  resources :adminstrators
  resources :super_admins
  get '/users/intro', to: 'users#intro'

  get 'home', to: 'home' ,controller: 'posts'
  get 'show', to: 'show', controller: 'users'
  get 'new', to: 'new', controller: 'users'
  get 'LogIn', to: 'LogIn',  controller: 'logins'
  get 'Profile', to: 'Profile', controller: 'user_profiles'
  get 'publish', to: 'publish', controller: 'posts'
  get 'deletePost', to: 'deletePost', controller: 'posts'
  get 'search_user', to: 'search_user',controller: 'users'
  get 'uConfig', to: 'uConfig', controller: 'users'
  get 'LogIn', to: 'LogIn', controller: 'users'
  get 'full_post', to: 'full_post', controller: 'posts'
  get 'view_user', to: 'view_user', controller: 'users'
  get 'blacklist', to: 'blacklist', controller: 'black_lists'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'black_lists#blacklist'
end
