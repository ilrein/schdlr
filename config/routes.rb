Rails.application.routes.draw do

  resources :shifts
  resources :companies
  resources :schedules
  resources :locations
  resources :employees

  devise_for :users
  get 'home/index'
  get 'home/preparation'
  root 'home#index', as: ''
end
