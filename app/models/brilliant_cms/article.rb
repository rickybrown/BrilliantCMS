module BrilliantCms  
  class Article < BrilliantCms::Entry
    searchable_attributes :title, :body

    content_attr :body, :text

    validates :body, presence: true
  end
end