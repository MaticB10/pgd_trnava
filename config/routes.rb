Rails.application.routes.draw do
  resources :gallery_categories
  get "home/index"
  root "home#index"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Kasneje bomo dodali še routanje za funkcionalnosti, npr. novice, intervencije, galerije

  # Primer:
  resources :novicas
  resources :intervencijas
  resources :galerijas
end
