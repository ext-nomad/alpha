Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'home#about'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, except: %i[new]
  resources :articles do
    resources :comments, only: %i[create destroy]
  end
  resources :categories, except: %i[destroy]
end
