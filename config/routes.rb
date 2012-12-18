Fourchal::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users

  resources :users do
    resources :competition_entries do
      resources :challenge_entries
    end
  end

  resources :competitions do
    resources :competition_entries do
      resources :challenge_entries
    end
  end
end
