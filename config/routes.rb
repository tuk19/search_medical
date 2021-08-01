Rails.application.routes.draw do
  root to: 'top#index'
  get "top/user_info"
  get "top/medicalstaff_info"
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  devise_for :medicalstaffs
  resources :medicalstaffs, only: [:index, :edit, :update]
  resources :institutions do
    resource :favorites, only: [:create, :destroy]
    resource :staff_institutions, only: [:create, :destroy]
    member do
      get "consultationhour"
    end
  end
  resources :consultationhours
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
