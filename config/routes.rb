# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :posts
    resources :pages
    resources :photos
    resources :albums
  end
  get '/blog/(:slug)', to: 'content#post', as: 'blog'
  get '/photos', to: 'content#photos', as: 'photos'
  get '/photos/(:slug)', to: 'content#photo', as: 'photo'
  get '/(:slug)', to: 'content#page', as: 'page'
end
