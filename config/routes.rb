# frozen_string_literal: true

Rails.application.routes.draw do
  resources :messages, only: %i[index show destroy]
  resources :messaging_services
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
