Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: 'lists#index'

  # get 'lists', to: 'lists#index'
  # get '/new', to: 'lists#new', as: :new
  # get '/:id', to: 'lists#show', as: :list
  # post '/lists', to: 'lists#create'
  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[new create] do
      resources :movies, only: %i[show]
    end
  end
  resources :bookmarks, only: %i[destroy]
  resources :movies, only: %i[index show]
end
