# Application route
Rails.application.routes.draw do
  mount BrilliantCms::Engine, at: '/admin'
end

# Engine routes
BrilliantCms::Engine.routes.draw do

  scope "/:content_class" do
    resources :entries
  end

  root 'dashboard#index'
end
