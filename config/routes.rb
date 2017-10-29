Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'registration', to: 'registration#index'
  resources :user
end

