# frozen_string_literal: true

Rails.application.routes.draw do
  root "application#index"
  resources :messages, only: %i[index show destroy]
  resources :messaging_services
end
