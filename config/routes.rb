Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root "home#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dashboard, only: %i[index]
      resources :categories, only: %i[index show]
      resources :search, only: %i[index]
      resources :recently_heards, only: %i[create]
      resources :songs, only: [] do
        concerns :favoritable, favoritable_type: 'Song'
      end 
      resources :favorites, only: :index
    end
  end

  concern :favoritable do |options|
    shallow do
      post "/favorite", { to: "favorites#create", on: :member }.merge(options)
      delete "/favorite", { to: "favorites#destroy", on: :member }.merge(options)
    end
  end
end
