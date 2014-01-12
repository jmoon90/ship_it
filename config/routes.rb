Shipit::Application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :feedbacks, only: [:create]
    resources :votes, only: [:create, :destroy]
  end
end
