Rails.application.routes.draw do
  root to: 'articles#index'
  
  resources :articles
  get "search", to: "search#search"
  get 'search/typeahead/:term' => 'search#typeahead'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
