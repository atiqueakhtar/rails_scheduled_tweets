Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about-us", to: "about#index", as: :about

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create" 
  get "password/reset/edit", to: "password_resets#edit"
  post "password/reset/edit", to: "password_resets#update" 

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"

  resources :articles do
    resources :comments
  end

  get "my_articles", to: "articles#my_articles"
  get "other_articles", to: "articles#other_articles"
  get "archived_articles", to: "articles#archived_articles"
end
