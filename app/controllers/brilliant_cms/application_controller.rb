module BrilliantCms
  class ApplicationController < ActionController::Base
    helper FontAwesome::Rails::IconHelper
    
    before_action :authenticate_user!

    protected

    def content_entries_path
      entries_path(content_class: content_class.tableize)
    end
    helper_method :content_entries_path

    def content_entry_path(entry)
      entry_path(entry, content_class: content_class.tableize)
    end
    helper_method :content_entry_path

    def new_content_entry_path
      new_entry_path(content_class: content_class.tableize)
    end
    helper_method :new_content_entry_path

    def edit_content_entry_path(entry)
      content_class = tableize_type(entry.type)
      edit_entry_path(entry, content_class: content_class)
    end
    helper_method :edit_content_entry_path

    def tableize_type(entry)
      entry.split(':').last.tableize
    end
    helper_method :tableize_type
  end
end