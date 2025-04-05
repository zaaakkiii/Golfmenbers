Rails.application.routes.draw do
  namespace :public do
    resources :golf_courses, only: [:new, :create, :index, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end
  devise_for :users

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :golf_courses do
      resource :favorites, only: [:create, :destroy]
    end
    post 'guest_login', to: 'users#guest_login'
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
