Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
	root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/team', to: 'static_pages#team'
  get '/chat', to: 'static_pages#chat'
  get '/workshops', to: 'static_pages#workshops'
  get '/gallery', to: 'static_pages#gallery'
  get '/project_under_rbd', to: 'static_pages#project_under_rbd'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/projects_approve', to: 'users#projects_approve'
  patch '/projects_approve', to: 'projects#update'
  get '/admin_approve', to: 'users#admin_approve'
  patch '/admin_approve', to: 'users#update_admin'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #get '/users', to: 'users#update'

  resources :users
  resources :projects, only: [:new, :create, :edit, :destroy, :update]
  resources :conversations, only: [:create] do
  	member do
  		post :close
  	end
  	resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
