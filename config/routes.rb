Rails.application.routes.draw do
  resources :todos
  devise_for :users
  root 'todos#index'
end
