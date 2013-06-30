DevFiltr::Application.routes.draw do
  resources :assessments do
    member do
      resources :assessment_attempts, only: [:new, :create]
    end
  end
  
  resources :assessment_attempts, except: [:new, :create]
  
  resource :session
  resources :users
end

