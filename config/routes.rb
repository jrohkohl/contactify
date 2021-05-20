Rails.application.routes.draw do
  
  root "contacts#index"
  
  

  devise_for :users

  resources :members
  resources :groups
  resources :contacts
  
  resources :users, only: :show
  
  
end
