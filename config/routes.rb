Rails.application.routes.draw do
  
  root to: 'locations#home'

  resources :users, only: [:show] do
    resources :locations, only: [:index, :show, :new, :create, :edit, :update]
  end

 resources :locations, only: [:index, :show]
  resources :users
  
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #resources :locations do
    #resources :edibles
  #end

  resources :edible_categories
  resources :edibles
  #end

  

  

  #devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
