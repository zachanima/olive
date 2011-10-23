Olive::Application.routes.draw do
  resources :links do
    post :sort, on: :collection
  end

  resources :pages do
    get :manage, on: :member
    post :sort, on: :collection
    resources :sections do
      post :sort, on: :collection
    end
  end

  root :to => 'pages#home'
end
