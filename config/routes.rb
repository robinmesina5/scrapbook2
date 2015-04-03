Rails.application.routes.draw do

	get 'trees/index'
	get 'trees/data', :defaults => { :format => 'json' }

  resources :relatives, :only => [:index, :create, :new, :update, :destroy, :show, :edit, :delete]

  resources :scrapbooks, :only => [:index, :create, :new, :update, :destroy, :show, :delete, :edit]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, :only => [:create, :new]
  
  root :to => 'welcome#index'

end
