Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :file_managements
  # do
    # collection do
      # get :index
    # end
  # end
end
