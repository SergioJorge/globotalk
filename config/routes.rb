Globotalk::Application.routes.draw do
  root :to => 'talks#index'
  resources :talks
end
