Rails.application.routes.draw do
  get 'registration', to: 'registration#index'
  get 'tweet', to: 'tweet#index'
  resources :user
  resources :tweet
end

