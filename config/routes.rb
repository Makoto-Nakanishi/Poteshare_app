Rails.application.routes.draw do
  resources :events do
    collection do
      resources :reservations
    end
    collection do
      get 'search'
    end
  end
  post 'reservations/confirm' 
  post 'reservations/back' 
  resources :tops
  devise_for :users
  root 'tops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
