Rails.application.routes.draw do

  resources :ideas
  resources :contacts
  resources :manage_ideas
  resources :received_contacts
  resources :topics
  resources :top_ideas

  root 'welcome#index'

  get '/en' => 'welcome#index_en', as: 'english'
  get '/ideas_en' => 'ideas#index_en', as: 'ideas_english'
  get '/contacts_en' => 'contacts#index_en', as: 'contacts_english'
  get '/admin' => 'admin#login', as: 'login'


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
