Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => 'omniauth_callbacks'}
  get 'home/index'

  get 'home/school_class_new' => 'home#school_class_new'
  post 'home/school_class_new' => 'home#create'

  get '/dashboard' => 'dashboard#get'
  get '/dashboard/delete_file' => 'dashboard#delete_file'
  get '/dashbard/download_file' => 'dashboard#download_file'
  post '/dashboard' => 'dashboard#upload_file'

  get '/user' => "dashboard#get", :as => :user_root

  get '/subjects' => 'subjects#index'
  get '/subjects/:id' => 'subjects#show'
  get '/subjects/:id/download_file' => 'subjects#view_file'

  resources :posts

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
