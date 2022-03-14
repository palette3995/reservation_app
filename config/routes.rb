Rails.application.routes.draw do
  root 'top#index'
  get 'search' => 'rooms#search'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :reservations do
    post :confirm_new, on: :member
  end
end
