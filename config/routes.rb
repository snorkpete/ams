Ams::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'announcements/:last_date' => "announcements#index"
    end
  end
  resources :devices do
    collection do
      
      # Adding of new devices' registration id 
      #- used by android app to register for GCM messages
      post 'register' 
    end
  end

  resources :announcements do
    member do
      post 'push'
      post 'reset'
    end
  end


  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
