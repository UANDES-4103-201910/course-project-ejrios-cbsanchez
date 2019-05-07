Rails.application.routes.draw do
  resources :users
  resources :dump_lists
  resources :black_lists
  resources :user_profiles
  resources :commentaries
  resources :adminstrators
  resources :super_admins
  get '/users/intro', to: 'users#intro'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#prueba'
end
