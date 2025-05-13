Rails.application.routes.draw do
  devise_for :admins, path: :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/admins/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }

  namespace :admin do
    root to: 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :comments, only: [:index, :destroy]
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :golf_courses do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    post 'guest_login', to: 'users#guest_login'
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
