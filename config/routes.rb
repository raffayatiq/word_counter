Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show]
  
  resources :books, only: [:create]

  root :to => redirect('/projects')
end
