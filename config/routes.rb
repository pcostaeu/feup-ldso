Rails.application.routes.draw do

  resources :admins
  resources :ideas
  resources :contacts
  resources :manage_ideas
  resources :received_contacts
  resources :topics
  resources :top_ideas

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'update', to: 'admins#update', as: 'update'

  get 'about', to: 'creators#index', as: 'creators'

  root 'welcome#index'

  get '/en' => 'welcome#index_en', as: 'english'
  get '/ideas_en' => 'ideas#index_en', as: 'ideas_english'
  get '/contacts_en' => 'contacts#index_en', as: 'contacts_english'

  resources :topics do
    member do
      post :new
    end
  end

  resources :received_contacts do
    member do
      post :read
    end
  end

  resources :received_contacts do
    member do
      post :delete
    end
  end

  resources :top_ideas do
    member do
      post :remove
    end
  end

  resources :manage_ideas do
    member do
      post :approve
    end
  end

  resources :manage_ideas do
    member do
      post :delete
    end
  end

  get '*unmatched_route', to: 'application#not_found'
end
