Rails.application.routes.draw do
  get 'admin_pages/index'

  get '/mypages' => 'mypages#index'
  get '/mypages/edit'

  get 'admin_pages/index2', as: 'admin_pages_index2'
  post 'admin_pages/search'

  resources :question2s
  resources :question3s
  resources :admin_pages

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mypages#index'
end
