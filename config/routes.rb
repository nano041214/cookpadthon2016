Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions do
  end

  get '/logout' => 'sessions#destroy'

end
