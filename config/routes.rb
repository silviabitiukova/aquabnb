Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boats
  get "/dashboard", to: "dashboards#index", as: :dashboard
end
