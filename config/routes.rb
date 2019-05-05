# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :projects do
        resources :items
      end
      post '/auth', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
    end
  end
end
