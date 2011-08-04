Olive::Application.routes.draw do
  resources :pages do
    resources :sections
  end

  root :to => 'pages#home'
end
