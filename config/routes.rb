MeetWithFriends::Application.routes.draw do
  # Generated routes
  resources :users
  resources :invitations
  resources :events
  resources :sessions
  
  match 'home' => 'home#index', :as => :home

  # add custom routes for certain actions
  match 'save_coords' => 'application#save_coords'
  match 'register' => 'home#register', :as => :register
  match 'check_in' => 'events#check_in'
  
#   match 'user/edit' => 'users#edit', :as => :edit_current_user
#   match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
      
  
  # Set the root url
  root :to => 'home#index'
end
