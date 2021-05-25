Rails.application.routes.draw do
  root "articles#index"

  get '/articles/search' => 'articles#search', :as => 'search_articles'

  resources :articles do
    resources :comments
  end
end