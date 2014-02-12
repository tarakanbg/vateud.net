VateudNet::Application.routes.draw do

  namespace :mercury do
    resources :images
  end
  devise_for :admin_users, ActiveAdmin::Devise.config

  mount Mercury::Engine => '/'

  root :to => 'home#index'

  ActiveAdmin.routes(self)

  post 'pages/move_left/:id' => 'pages#move_left'
  post 'pages/move_right/:id' => 'pages#move_right'


  put 'news/:id' => 'news#mercury_update', :as => :news
  put 'pages/:id' => 'pages#mercury_update', :as => :page
  put '/:id' => 'pages#mercury_update', :as => :page
  put '/:id/:id' => 'pages#mercury_update', :as => :page
  put '/:id/:id/:id' => 'pages#mercury_update', :as => :page
  put '/:id/:id/:id/:id' => 'pages#mercury_update', :as => :page
  put '/:id/:id/:id/:id/:id' => 'pages#mercury_update', :as => :page
  # put 'pages' => 'pages#mercury_update'
  # post 'pages/:id' => 'pages#mercury_update'
  # post 'home/:id' => 'home#mercury_update'

  # resources :pages do
  #   member { put :mercury_update }
  # end

  get 'news' => 'news#index'
  get 'help' => 'home#help'
  get 'events' => 'events#index'
  get 'countries' => 'countries#index'
  get 'countries/:id' => 'countries#show'
  get 'airports/:id' => 'airports#show'


  get 'news/:id' => 'news#show', :as => :news

  get '/:id' => 'pages#show', :as => :page
  get '/:id/:id' => 'pages#show', :as => :page
  get '/:id/:id/:id' => 'pages#show', :as => :page
  get '/:id/:id/:id/:id' => 'pages#show', :as => :page
  get '/:id/:id/:id/:id/:id' => 'pages#show', :as => :page

end
