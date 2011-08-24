Olive::Application.routes.draw do
  resources :pages do
    post :sort, on: :collection
    resources :sections do
      post :sort, on: :collection
    end
  end

  root :to => 'pages#home'
end
