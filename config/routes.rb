Rails.application.routes.draw do
  resources :events do
    resources :reservations
  end
  post 'reservation/confirm' # 確認画面
  post 'reservation/back' # 確認画面から「入力画面に戻る」をクリックしたとき
  post 'reservation/complete' # 完了画面
  resources :tops
  devise_for :users
  root 'tops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
