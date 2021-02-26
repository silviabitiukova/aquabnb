Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boats do
    resources :bookings, only: [:new, :create]
  end
  get "/dashboard", to: "dashboards#index", as: :dashboard
  get "/dashboard", to: "dashboards#index_owner", as: :dashboard_owner
  get "/dashboard", to: "dashboards#index_incoming", as: :dashboard_incoming
end

# patch '/bookings/:id/accept', to: 'bookings#accepted', as: 'accepted'
# patch '/bookings/:id/decline', to: 'bookings#declined', as: 'declined'