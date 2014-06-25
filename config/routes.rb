Api::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  

  resources :users do
    resources :contacts
  end

  root to: "main#index"
 
end
