Rails.application.routes.draw do
  root 'users#index'
  resources :recipe_foods
  resources :foods
  resources :recipes
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
