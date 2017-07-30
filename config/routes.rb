Rails.application.routes.draw do
  #get 'welcome/index'

  root to: 'welcome#index'
  # get 'user_questions/index'

  # get 'answers/index'

  # get 'answers/new'

  # get 'answers/create'

  # get 'answers/destroy'

  # get 'drill_groups/index'

  # get 'drill_groups/new'

  # get 'drill_groups/create'

  # get 'drill_groups/destroy'

  # get 'badges/index'

  # get 'questions/index'

  # get 'questions/new'

  # get 'questions/create'

  # get 'questions/show'

  # get 'questions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  resources :questions, only: [:new, :create, :destroy, :index, :show] do
    resources :users_questions, only: [:new, :create, :destroy, :index]
  end


  resources :answers, only: [:new, :create, :destroy, :index]

  resources :drill_groups, only: [:new, :create, :destroy, :index, :show]

  resources :answers, only: [:new, :create, :destroy, :index]

  resource :session, only: [:new, :create, :destroy]

end
