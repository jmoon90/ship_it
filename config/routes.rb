Shipit::Application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show, :new, :create] do
    resources :feedbacks, only: [:create]
  end
end
