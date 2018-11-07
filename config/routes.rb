Rails.application.routes.draw do
  devise_for :users
  resources :gossips
  root to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/club', to: 'static_pages#club'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
