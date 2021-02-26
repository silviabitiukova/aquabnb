Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boats do
    resources :bookings, only: [:new, :create]
  end
  resources :dashboards, only: [:index] do
    collection do
      get :index_owner
      get :index_incoming
    end
  end
end
