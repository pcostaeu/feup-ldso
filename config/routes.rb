Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/new'

  get 'topics/create'

  get 'welcome/index'

  resources :ideas
  resources :contacts
  resources :month_ideas
  resources :approve_ideas
  resources :received_contacts

  root 'welcome#index'

  get '/en' => 'welcome#index_en', as: 'english'
  get '/ideas_en' => 'ideas#index_en', as: 'ideas_english'
  get '/contacts_en' => 'contacts#index_en', as: 'contacts_english'
  get '/admin' => 'admin#login', as: 'login'

  resources :ideas do
    member do
      post :upvote
    end
  end

  resources :ideas do
    member do
      post :downvote
    end
  end

  resources :ideas do
    member do
      post :cancel
    end
  end

  resources :approve_ideas do
    member do
      post :approve
    end
  end

  resources :approve_ideas do
    member do
      post :delete
    end
  end
  resources :month_ideas do
    member do
      post :select
    end
  end
end
