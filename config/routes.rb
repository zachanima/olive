Olive::Application.routes.draw do
  resources :pages do
    post :sort, on: :collection
    resources :sections
  end

  root :to => 'pages#home'
end
