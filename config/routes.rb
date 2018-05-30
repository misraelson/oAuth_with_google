Rails.application.routes.draw do

  get 'streams/index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'streams#index'

  # api endpoints
  get '/api/streams', to: 'streams#all'
  get '/api/messages', to: 'messages#all_in_chat'
  get '/api/messages_by_author', to: 'authors#messages'
  post '/api/messages', to: 'messages#create'

end
