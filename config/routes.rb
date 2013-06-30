DevFiltr::Application.routes.draw do
  get "assessment_attempts/index"

  get "assessment_attempts/show"

  get "assessment_attempts/new"

  get "assessment_attempts/edit"

  get "assessments/index"

  get "assessments/show"

  get "assessments/new"

  get "assessments/edit"

  resource :session
  resources :users
end
