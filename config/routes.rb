Rails.application.routes.draw do
  root to: 'top#index'
  get 'medicalstaffs/index'
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  devise_for :medicalstaffs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
