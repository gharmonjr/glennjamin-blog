# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :posts
  end
  resources :blog_posts, only: %i[index show]
end
