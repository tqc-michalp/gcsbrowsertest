# frozen_string_literal: true

Rails.application.routes.draw do
  root 'images#index'
  resources :images, only: %i[index]
end
