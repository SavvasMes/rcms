Rails.application.routes.draw do
  root 'pages#home'

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  post '/send_contact', to: 'pages#send_contact'

  scope 'pages', controller: :pages, as: :pages do
    get 'index'
    get 'new'
    post 'create'

    get 'edit/:id', action: :edit, as: :edit
  end


end
