Rails.application.routes.draw do
 # get 'sessions/login,'

  #get 'sessions/home,'

  #get 'sessions/profile,'

  #get 'sessions/setting'

  resources :users 
 resources :sessions
end
