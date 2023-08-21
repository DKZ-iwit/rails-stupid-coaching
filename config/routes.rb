Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/askcoach', to: 'questions#askcoach'
  get '/answer', to: 'questions#answer'
  # Defines the root path route ("/")
  # root "articles#index"
end
