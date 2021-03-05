Rails.application.routes.draw do
  devise_for :admins

  resources :billings
  resources :client_payment_methods
  resources :clients
  resources :payment_methods  

  root to: 'billings#index'
end
