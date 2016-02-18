BrilliantCms::Engine.routes.draw do
  scope "/:content_class" do
    resources :entries
  end
end
