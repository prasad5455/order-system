Rails.application.routes.draw do

  resources :stores do
    resources :products
  end

  devise_for :users

  devise_for :views

  root to: 'home#index'
end
