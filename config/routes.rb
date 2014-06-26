Api::Application.routes.draw do


  #match '*all' => 'application#cor', :constraints => {:method => 'OPTIONS'}


  match 'users/sign_in', to: 'sessions#create', via: [:options]

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  

  resources :users do
    resources :contacts
  end

  root to: "main#index"
 
end
