Rails.application.routes.draw do
  resources :gradings
  resources :submissions
  devise_for :students
  resources :students
  devise_for :teachers
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
