Rails.application.routes.draw do
  
  root "contacts#index"
  
  

  devise_for :users

  resources :members, only: [:new, :create, :destroy]
  resources :groups
  resources :contacts
  
  resources :users, only: :show


  get "/members/remove/:group_id", to: "members#remove", as: "remove_member"

  
  
  
end
