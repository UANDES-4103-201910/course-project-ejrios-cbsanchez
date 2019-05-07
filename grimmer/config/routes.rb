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
  get 'search_user', to: 'search_user', controller: 'users'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#LogIn'
end
