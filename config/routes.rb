Rails.application.routes.draw do
  root :to => 'home#index' 

  resources :admin_users
  devise_for :users
  resources :battle_games
  resources :battles

   namespace :v1, :defaults => { :format => :json } do 
     get :me, to: 'admin_users#me'
       
  	 resources :battles do
        post :fight
     end

     resources :battle_games
	   
  end
end
