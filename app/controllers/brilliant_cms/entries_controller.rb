require_dependency "brilliant_cms/application_controller"

module BrilliantCms
  class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
      if blog?
        @entries = blog_posts_with_links.order('id desc')
      else
        @entries = Entry.where(type: module_class_string.constantize)
      end
    end

    def search
      @entries = Entry.where(type: module_class_string.constantize).search(params[:query])
      render action: 'index'
    end

    def show
      if blog?
        @entry = Entry.find_by_slug!(params[:slug])
      end
    end

    def new
      @entry = Entry.new(type: module_class_string)
    end

    def edit
    end

    def create
      @entry = Entry.new(entry_params)

      if @entry.save
        redirect_to content_entry_path(@entry), notice: 'Entry was successfully created.'
      else
        render :new
      end
    end

    def update
      if @entry.update(entry_params)
        redirect_to content_entry_path(@entry), notice: 'Entry was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @entry.destroy
      redirect_to content_entries_path, notice: 'Entry was successfully destroyed.'
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def blog?
      params[:content_class] == 'blog'
    end
    helper_method :blog?

    def blog_posts_with_links
      Entry.where(type: %w(BrilliantCms::BlogPost BrilliantCms::BlogLink))#.published
    end

    def entry_params
      allowed_attrs = %i(id type title slug published_at)
        .concat(module_class_string.constantize.content_attributes.keys)

      params.require(:entry).permit(*allowed_attrs)
    end

    def module_class_string
      "BrilliantCms::#{content_class}"
    end

    def content_class 
      @content_class ||= params[:content_class].classify
    end
    helper_method :content_class
  end
end
