Rails.application.routes.draw do
  devise_for :caseworkers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :caseworkers do
  	get 'dashboard', to: 'dashboards#show'
  end


  resources :members

  get '/activity', to: 'activities#index'
  get '/activity_table', to: 'activities#activity_table'

  resources :cases do
    post 'find', to: 'cases#find', on: :collection
    get 'activities', to: "cases#all_activity", on: :collection
    post 'activities', to: 'cases#create_activity'
  end


  devise_scope :caseworker do
	  # add after sign in path
	  #  https://stackoverflow.com/questions/19855866/how-to-set-devise-sign-in-page-as-root-page-in-rails
	  root :to => 'devise/sessions#new'
	end

end
