Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipe_foods
  resources :foods
  resources :recipes
  devise_for :users

  get 'public_recipes', to: 'recipes#public_index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
