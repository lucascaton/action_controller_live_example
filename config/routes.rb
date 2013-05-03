ActionControllerLiveExample::Application.routes.draw do
  root to: 'pages#index'

  get 'index2' => 'pages#index2'
  get 'items' => 'pages#items'
end
