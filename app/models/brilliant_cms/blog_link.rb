module BrilliantCms  
  class BlogLink < BrilliantCms::Entry
    content_attr :url, :string
    content_attr :quote, :text
    content_attr :comment, :text

    validates :url, presence: true
    validates :quote, presence: true
  end
end