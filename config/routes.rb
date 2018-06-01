Rails.application.routes.draw do
  get 'mypages/index',as:'mypages'
  get 'mypages/after_sign_up'

  #devise_for :users
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }
  resources :question2s
  resources :question3s
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mypages#index'
end
