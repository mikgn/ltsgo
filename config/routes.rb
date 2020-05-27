Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'events#index'
  resources :events
  resources :users, only: [:show, :edit, :update]
end
