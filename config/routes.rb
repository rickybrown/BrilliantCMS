# Application route
Rails.application.routes.draw do
  mount BrilliantCms::Engine, at: '/admin'
end

# Engine routes
BrilliantCms::Engine.routes.draw do
  devise_for :users,  
    class_name: "BrilliantCms::User", 
    module: :devise,
    controllers: {
      registrations: 'brilliant_cms/registrations'
    },
    path: '', path_names: {
      edit: 'settings',
      sign_up: 'start',
      sign_in: 'login',
      sign_out:'logout'
    }

  scope "/:content_class" do
    get 'search', to: 'entries#search', as: :search
    resources :entries
  end

  root 'dashboard#index'
end