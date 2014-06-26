Api::Application.routes.draw do


  #match '*all' => 'application#cor', :constraints => {:method => 'OPTIONS'}


 

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  
  devise_scope :user do
    match '/users/sign_in', to: 'sessions#create', via: [:options]
  end


  resources :users do
    resources :contacts
  end

  root to: "main#index"
 
end
