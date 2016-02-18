module BrilliantCms
  class Engine < ::Rails::Engine
    isolate_namespace BrilliantCms

    require 'jquery-rails'
    require 'simple_form'
    require 'bootstrap-sass'
    require 'font-awesome-rails'
  end
end
