DevFiltr::Application.routes.draw do
  devise_for :users

  root :to => "root#root" 
  resources :assessments do
    member do
      resources :assessment_attempts, only: [:new, :create]
    end
    collection do
      get "/demo" => "assessments#demo"
    end
  end
  
  resources :assessment_attempts, except: [:new, :create]
  get "/prices" => "root#prices"
  get "/languages"  => "root#languages"
end

