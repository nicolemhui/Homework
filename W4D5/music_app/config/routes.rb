Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :index, :show]
  resources :bands do
    resources :albums, only: [:new]
  end
   
  resource :session, only: [:new, :create, :destroy]
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
end