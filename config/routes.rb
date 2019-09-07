Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  resources 'blogs'
  resources :pages, only: %w{show index}
  resources :searches, only:  %w{show index}

  namespace :admin do
    resources :dashboards, only: :index
    resources :pages
  end
end
