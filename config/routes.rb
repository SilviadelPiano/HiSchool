Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  get 'home/index'

  get 'home/school_class_new' => 'home#school_class_new'
  post 'home/school_class_new' => 'home#create'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
