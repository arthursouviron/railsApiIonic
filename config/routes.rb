Api::Application.routes.draw do


  #match '*all' => 'application#cor', :constraints => {:method => 'OPTIONS'}



  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  
  match '*all', to: 'application#set_cors', via: [:options]

  resources :users do
    resources :contacts
  end

  root to: "main#index"
 
end
