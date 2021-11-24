Rails.application.routes.draw do
  root 'recipes#public_index'
  resources :recipe_foods
  resources :foods
  resources :recipes
  devise_for :users

  get 'public_recipes', to: 'recipes#public_index'
  post 'recipes/:id/update_public', to: 'recipes#update_public'
  get '/general_list', to: 'recipe_foods#general_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
