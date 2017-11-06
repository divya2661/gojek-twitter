Rails.application.routes.draw do
  get 'tweet/new'

  get 'tweet/index'
  get 'registration', to: 'registration#index'
  resources :user
  resources :tweet
end

