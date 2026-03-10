Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "tasks#index"

  resources :tasks

  get 'tasks', to: "tasks#index"
  get 'tasks/find', to: "tasks#find"
  get 'tasks/:id', to: "tasks#show"
  get 'tasks/new', to: "tasks#new"
  post 'tasks', to: "tasks#create"
  patch 'tasks/:id', to: "tasks#update"
  delete 'tasks/:id', to: "tasks#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


end
