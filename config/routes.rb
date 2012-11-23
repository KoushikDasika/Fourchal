Fourchal::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users

  resources :users do
    resources :competitions
  end

  resources :competitions
end
