MeetWithFriends::Application.routes.draw do
  # Generated routes
  resources :users
  resources :invitations
  resources :events
  
  match 'home' => 'home#index', :as => :home
  
#   match 'user/edit' => 'users#edit', :as => :edit_current_user
#   match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
      
  # add custom routes for certain actions
  get 'check_in' => 'events#check_in', :as => :check_in
  
  # Set the root url
  root :to => 'home#index'
end
