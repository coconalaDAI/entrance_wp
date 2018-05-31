Rails.application.routes.draw do
  get 'mypages/index',as:'mypages'

  devise_for :users
  resources :question2s
  resources :question3s
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mypages#index'
end
