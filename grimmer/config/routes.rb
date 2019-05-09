Rails.application.routes.draw do
  resources :users
  resources :dump_lists
  resources :black_lists
  resources :user_profiles
  resources :commentaries
  resources :adminstrators
  resources :super_admins
  resources :posts
  get '/users/intro', to: 'users#intro'
  get 'index', to: 'index',controller:'users'
  get 'index', to: 'index',controller:'posts'
  get 'new', to: 'new',controller:'posts'

  get 'home', to: 'home' ,controller: 'posts'
  get 'show', to: 'show', controller: 'users'
  get 'new', to: 'new', controller: 'users'
  get 'LogIn', to: 'LogIn',  controller: 'users'
  get 'Profile', to: 'Profile', controller: 'user_profiles'
  get 'publish', to: 'publish', controller: 'posts'
  get 'deletePost', to: 'deletePost', controller: 'posts'
  get 'search_user', to: 'search_user',controller: 'users'
  get 'search_post', to: 'search_post', controller:'posts'
  get 'uConfig', to: 'uConfig', controller: 'users'
  get 'full_post', to: 'full_post', controller: 'posts'
  get 'view_user', to: 'view_user', controller: 'users'
  get 'blacklist', to: 'blacklist', controller: 'black_lists'
  get 'home_admin' , to: 'home_admin', controller: 'adminstrators'
  get 'dumplist', to: 'dumplist', controller: 'dump_lists'
  get 'signIn', to: 'signIn',  controller: 'users'
  get 'usePolicy', to: 'usePolicy',  controller: 'users'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#LogIn'
end
