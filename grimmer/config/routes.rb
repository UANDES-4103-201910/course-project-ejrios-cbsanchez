Rails.application.routes.draw do
  resources :location_admins
  resources :locations
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :users
  resources :dump_lists
  resources :black_lists
  resources :user_profiles
  resources :commentaries
  resources :adminstrators
  resources :super_admins
  resources :posts
  resources :sessions
  resources :password_resets, only: [:new, :create, :edit, :update]

  post 'password_resets/update', to: 'password_resets#edit'

  resources :posts do
    resources :upvotes
  end
  resources :posts do
    resources :downvotes
  end
  resources :posts do
    resources :inappropiates
  end
  resources :posts do
    resources :follows
  end

  post 'create_commentarie', to: 'posts#create_commentarie', as: 'create_commentarie'
  patch 'update_user', to: 'user_profiles#update_user', as: 'update_user'

  #for google autenticathion
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  ## end google routes

  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/users/intro', to: 'users#intro'
  get 'index', to: 'index',controller:'users'
  get 'index', to: 'index',controller:'posts'
  get 'new', to: 'new' ,controller: 'posts'
  get 'new_users', to: "users#new", as:"new_users"
  get 'superAdminNew', to: "adminstrators#new", as: "superAdminNew"

  get 'full_post', to: 'full_post', controller: 'posts'
  get 'home', to: 'home' ,controller: 'posts'
  get 'show', to: 'show', controller: 'users'
  get 'LogIn', to: 'LogIn',  controller: 'sessions'
  get 'Profile', to: 'Profile', controller: 'user_profiles'
  get 'deletePost', to: 'deletePost', controller: 'posts'
  get 'search_user', to: 'search_user',controller: 'users'
  get 'search_post', to: 'search_post', controller:'posts'
  get 'uConfig', to: 'uConfig', controller: 'users'
  get 'view_user', to: 'view_user', controller: 'users'
  get 'blacklist', to: 'blacklist', controller: 'black_lists'
  get 'home_admin' , to: 'home_admin', controller: 'adminstrators'
  get 'dumplist', to: 'dumplist', controller: 'dump_lists'
  get 'usePolicy', to: 'usePolicy',  controller: 'users'
  get 'view_post', to: 'view_post', controller: 'posts'
  get 'modify_admin' , to: 'modify_admin', controller: 'adminstrators'
  get 'Admin_user_profile', to: 'Admin_user_profile', controller: 'user_profiles'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#LogIn'
end
