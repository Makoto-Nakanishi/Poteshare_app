Rails.application.routes.draw do
  resources :events do
    resources :reservations
  end
  post 'reservations/confirm' # 確認画面
  post 'reservations/back' # 確認画面から「入力画面に戻る」をクリックしたとき
  resources :tops
  devise_for :users
  root 'tops#index'
  get 'search' => 'events#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
