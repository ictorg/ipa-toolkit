# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  get '/verification/download', to: 'verification#download'
end
