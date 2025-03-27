Rails.application.routes.draw do
  namespace :public do
    get 'golf_courses/index'
    get 'golf_courses/show'
    get 'golf_courses/new'
    get 'golf_courses/edit'
  end
  devise_for :users

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :golf_courses
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
