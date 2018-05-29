Rails.application.routes.draw do
  namespace :api do
    resources :locations, only: :show, param: :country_code

    namespace :internal do
      resources :locations, only: :show, param: :country_code
    end
  end

  root controller: :pages, action: :root
end
