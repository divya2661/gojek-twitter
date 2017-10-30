Rails.application.routes.draw do
   get 'registration', to: 'registration#index'
  resources :user
end

