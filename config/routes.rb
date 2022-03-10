Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "submissions#index"
  resources :gradings
  resources :submissions
  devise_for :students
  resources :students
  devise_for :teachers
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
