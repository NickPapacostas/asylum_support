Rails.application.routes.draw do
  devise_for :caseworkers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :caseworkers do
  	get 'dashboard', to: 'dashboards#show'
  end

  devise_scope :caseworker do
	  # add after sign in path
	  #  https://stackoverflow.com/questions/19855866/how-to-set-devise-sign-in-page-as-root-page-in-rails
	  root :to => 'devise/sessions#new'
	end

end
