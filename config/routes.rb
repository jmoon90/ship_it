Shipit::Application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: [:index, :show, :new, :create] do
    resources :feedbacks, only: [:create]
  end
end
