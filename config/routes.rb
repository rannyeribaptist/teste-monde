Rails.application.routes.draw do
  devise_for :admins

  resources :billings
  resources :client_payment_methods
  resources :clients
  resources :payment_methods

  get '/clients/:id/payment_method', to: 'clients#edit_payment_method', as: :edit_client_payment
  post '/clients/:id/payment_method', to: 'clients#update_payment_method', as: :update_client_payment
  patch '/clients/:id/payment_method', to: 'clients#update_payment_method'

  get 'billings_of_the_day', to: 'billings#billings_of_the_day', as: :billings_of_the_day

  root to: 'billings#index'
end
