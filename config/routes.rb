Rails.application.routes.draw do
  get 'institutions/index'
  root to: 'top#index'
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  devise_for :medicalstaffs
  resources :medicalstaffs, only: [:index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
