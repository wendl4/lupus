Rails.application.routes.draw do





 	root 'home#index'


    resources :dataset_records, path: 'dataset'
    get 'dataset_records/index'
    get 'dataset_records/add_rating' => 'dataset_records#add_rating', as: :add_rating
    get 'dataset_records/add_comment' => 'dataset_records#add_comment', as: :add_comment
    get 'search/index'
    get 'home/search' => 'search#index', as: :home_search
	get 'login' => 'static#login', as: :login
	get 'mydataset' => 'mydatasets#index', as: :mydataset
	get 'mydataset/new' => 'mydatasets#new', as: :new_mydataset
	get 'mydataset/edit' => 'mydatasets#edit', as: :edit_mydataset
	get 'mydataset/delete' => 'mydatasets#delete', as: :delete_mydataset
	post 'mydataset/import' => 'mydatasets#import', as: :import_mydataset
	post 'mydataset/add_columns' => 'mydatasets#add_columns', as: :add_columns_mydataset
	post 'mydataset/edit_columns' => 'mydatasets#edit_columns', as: :edit_columns_mydataset
	get 'search' => 'search#index', as: :search
	get 'mydataset/1' => 'static#example', as: :example
	get 'mydataset/1/1' => 'static#organization_example', as: :organization_example
	get 'top' => 'static#top', as: :top
	get 'experiments' => 'static#experiments', as: :experiments
	get 'experiments/1' => 'static#experiments_example', as: :experiments_example
	get 'stats' => 'static#stats', as: :stats
	get 'about-us' => 'static#about', as: :about


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
