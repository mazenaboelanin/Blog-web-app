Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  ## Root Route ##
  root 'pages#home'
  ## ROUTES ##
  get 'about', to: 'pages#about'

  resources :articles

  # User Routes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # Login Routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Category Routes
  resources :categories, except: [:destroy]

end
