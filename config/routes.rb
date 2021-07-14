Rails.application.routes.draw do

  resources :categories
  resources :stores do
    resources :items
  end

  devise_for :users

  devise_for :views

  root to: 'home#index'
end
