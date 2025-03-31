Rails.application.routes.draw do
    root "home#index"
  
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
    # Admin panel za novice, intervencije in kategorije galerije
    namespace :admin do
      resources :novicas      # Novice
      resources :intervencijas # Intervencije
      resources :gallery_categories  # Kategorije slik
    end
  
    # Funkcionalnost za redne uporabnike – nalaganje slik v galerijo
    resources :galerijas, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Kasneje bomo dodali še routanje za funkcionalnosti, npr. novice, intervencije, galerije

  # Primer:
  resources :novicas
  resources :intervencijas
  resources :galerijas
end
