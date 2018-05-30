Rails.application.routes.draw do
  namespace :api do
    resources :locations, only: :show, param: :country_code
    resources :target_groups, only: :show, param: :country_code

    namespace :internal do
      resources :locations, only: :show, param: :country_code
      resources :target_groups, only: :show, param: :country_code
      resource :evaluate_target, only: :create
    end
  end

  root controller: :pages, action: :root
end
