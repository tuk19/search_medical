Rails.application.routes.draw do
  root to: 'top#index'
  get 'medicalstaffs/index'
  get 'users/index'
  devise_for :medicalstaffs
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
