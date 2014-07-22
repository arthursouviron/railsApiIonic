Api::Application.routes.draw do


  #match '*all' => 'application#cor', :constraints => {:method => 'OPTIONS'}

 
  match '/users/edit_avatar', to: 'sessions#isAuth', via: [:options]
  match '/users/edit_avatar', to: 'users#update_avatar', via: [:post, :put]


  match '/users/register_push', to: 'sessions#isAuth', via: [:options]
  match '/users/register_push', to: 'users#update_push_register_id', via: [:post, :put]


  match '/send_push', to: 'application#send_push', via: [:get]


  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  
  devise_scope :user do
    match '/users', to: 'registrations#new', via: [:options]
    match '/users/:id', to: 'sessions#isAuth', via: [:options]

    match '/users/:id', to: 'users#show', via: [:get]


    match '/users/:user_id/conversations', to: 'sessions#isAuth', via: [:options]
    match '/users/:user_id/conversations/:id', to: 'sessions#isAuth', via: [:options]
    match '/users/:user_id/conversations/:id/messages', to: 'sessions#isAuth', via: [:options]
    match '/users/:user_id/conversations/:id/send_message', to: 'sessions#isAuth', via: [:options]
    match '/users/:user_id/conversations/:id/send_message', to: 'conversations#send_message', via: [:post]



    match '/users/sign_in', to: 'sessions#create', via: [:options]
    match '/users/sign_out', to: 'sessions#destroy', via: [:options]
    match '/users/:id/contacts.json', to: 'sessions#isAuth', via: [:options]
    match '/users/:user_id/contacts/:id', to: 'sessions#isAuth', via: [:options]
  end


  resources :users do
    resources :contacts
    resources :conversations do
      resources :messages
    end
  end





  root to: "main#index"
 
end
