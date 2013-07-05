DevFiltr::Application.routes.draw do
  devise_for :users

  resources :assessments do
    resources :assessment_attempts
    collection do
      get "/demo" => "assessments#demo"
    end
  end
  resources :assessment_invites
  resources :assessment_attempts, except: [:new, :create]
  

  root :to          => "root#root" 
  get "/prices"     => "root#prices"
  get "/languages"  => "root#languages"
end

