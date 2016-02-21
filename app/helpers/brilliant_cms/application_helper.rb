module BrilliantCms
  module ApplicationHelper

    def chevron(text)
      "#{text} <span class='fa fa-chevron-down'></span>".html_safe
    end

  end
end
