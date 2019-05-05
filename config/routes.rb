# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, param: :_username
      post '/auth', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
    end
  end
end
