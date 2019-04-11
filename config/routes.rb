Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'auth/sessions',
      registrations: 'auth/registrations'
  }
  devise_scope :user do
    get '/login', to: 'auth/sessions#new'
    get '/signup', to: 'auth/registrations#new'
  end

  authenticated do
    root 'pages#index'
  end
  root 'pages#home'

  resources :pages
  resources :post_categories
end
