Rails.application.routes.draw do
  resources :client_payment_methods
  resources :clients
  resources :payment_methods
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
