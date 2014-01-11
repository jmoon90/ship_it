Shipit::Application.routes.draw do
  devise_for :users

  resources :posts, only: [:index]
end
