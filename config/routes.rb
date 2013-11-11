Ffcom::Application.routes.draw do
  resources :nodes

  apipie
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1, path: '1' do
      resources :nodes
    end
  end
end
