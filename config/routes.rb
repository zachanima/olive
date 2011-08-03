Olive::Application.routes.draw do
  resources :pages
  root :to => 'pages#home'
end
