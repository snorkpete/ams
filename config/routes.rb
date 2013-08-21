Ams::Application.routes.draw do
  get "devices/register"
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
