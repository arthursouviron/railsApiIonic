Api::Application.routes.draw do


  #match '*all' => 'application#cor', :constraints => {:method => 'OPTIONS'}


 
  match '/users/edit_avatar', to: 'users#update_avatar', via: [:put]

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  
  devise_scope :user do
    match '/users', to: 'registrations#new', via: [:options]
    match '/users/sign_in', to: 'sessions#create', via: [:options]
    match '/users/sign_out', to: 'sessions#destroy', via: [:options]
    match '/users/:id/contacts.json', to: 'sessions#isAuth', via: [:options]
  end


  resources :users do
    resources :contacts
  end

  root to: "main#index"
 
end
