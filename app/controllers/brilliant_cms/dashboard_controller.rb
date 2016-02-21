require_dependency "brilliant_cms/application_controller"

module BrilliantCms
  class DashboardController < ApplicationController

    def index
      @entry = BrilliantCms::Entry
      @user  = BrilliantCms::User
    end

  end
end
