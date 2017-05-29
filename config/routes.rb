Rails.application.routes.draw do



 	root 'home#index'

	get 'login' => 'static#login', as: :login
	get 'mydataset' => 'mydatasets#index', as: :mydataset
	get 'mydataset/new' => 'mydatasets#new', as: :new_mydataset
	post 'mydataset/import' => 'mydatasets#import', as: :import_mydataset
	post 'mydataset/add_columns' => 'mydatasets#add_columns', as: :add_columns_mydataset
	get 'dataset' => 'static#dataset', as: :dataset
	get 'mydataset/1' => 'static#example', as: :example
	get 'mydataset/1/1' => 'static#organization_example', as: :organization_example
	get 'top' => 'static#top', as: :top
	get 'experiments' => 'static#experiments', as: :experiments
	get 'experiments/1' => 'static#experiments_example', as: :experiments_example
	get 'stats' => 'static#stats', as: :stats
	get 'about-us' => 'static#about', as: :about


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
