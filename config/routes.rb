Rails.application.routes.draw do
  
  
  root to: 'pages#home'

  get '/login' => 'sessions#new' # show login form
  post '/login' => 'sessions#create' # form submit, perfomr login, redirect
  delete '/login' => 'sessions#destroy' # logout link goes here, perform logout, redirect

  delete '/activities/:id' => 'activities#destroy'

  resources :activities, :users, :categories, :comments, :bookings
  

end
