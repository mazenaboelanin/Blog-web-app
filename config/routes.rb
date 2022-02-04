Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  ## Root Route ##
  root 'pages#home'
  ## ROUTES ##
  get 'about', to: 'pages#about'
end
