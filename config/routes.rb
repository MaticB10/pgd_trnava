Rails.application.routes.draw do
    root "home#index"
  
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # Dodaj novo pot za admin dashboard, ki se usmerja v Admin::DashboardController#index
  get '/dashboard', to: 'admin/dashboard#index', as: :dashboard

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users, only: [] do
      member do
        patch :approve
        patch :reject
      end
    end
  end
  
    # Funkcionalnost za redne uporabnike – nalaganje slik v galerijo
    resources :galerijas, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Kasneje bomo dodali še routanje za funkcionalnosti, npr. novice, intervencije, galerije

  # Primer:
  resources :novicas
  resources :intervencijas
  resources :galerijas
end
