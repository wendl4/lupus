Rails.application.routes.draw do





 	root 'home#index'


    resources :dataset_records, path: 'dataset'
    resources :alerts, path: 'alerts/show'
    get 'alerts/index' => 'alerts#index', as: :index_alert
    get 'alerts/new' => 'alerts#new', as: :create_alert
    get 'alerts/approve' => 'alerts#approve', as: :approve_alert
    get 'alerts/decline' => 'alerts#decline', as: :decline_alert
    post 'add_alert' => 'alerts#add_alert'
    get 'dataset_records/index'
    get 'dataset_records/add_rating' => 'dataset_records#add_rating', as: :add_rating
    get 'dataset_records/add_comment' => 'dataset_records#add_comment', as: :add_comment
    get 'search/index'
    get 'home/search' => 'search#index', as: :home_search
    get 'login' => 'sessions#login', as: :login
    get 'logout' => 'sessions#logout', as: :logout
    post 'login_attempt' => 'sessions#login_attempt', as: :login_attempt
    get 'user' => 'users#index', as: :user_index
	get 'sign-up' => 'users#new', as: :sign_up
	post 'create' => 'users#create', as: :create_user
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
	get 'top10' => 'static#top10', as: :top10
	get 'experiments' => 'static#experiments', as: :experiments
	get 'experiments/1' => 'static#experiments_example', as: :experiments_example
	get 'stats' => 'static#stats', as: :stats
	get 'about-us' => 'static#about', as: :about


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
