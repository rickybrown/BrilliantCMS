module BrilliantCms  
  class BlogPost < BrilliantCms::Entry
    searchable_attributes :title, :body

    content_attr :body, :text

    validates :body, presence: true
  end
end