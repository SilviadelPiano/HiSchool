Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  get 'home/index'

  get 'home/school_class_new' => 'home#school_class_new'
  post 'home/school_class_new' => 'home#create'

  get '/dashboard' => 'dashboard#get'
  get '/user' => "dashboard#get", :as => :user_root

  get '/subjects' => 'subjects#index'
  get '/subjects/:id' => 'subjects#show'

  resources :posts

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
