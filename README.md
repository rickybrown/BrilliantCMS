# BrilliantCMS

The Goal: To create an easy CMS interface for Rails apps, and avoid having a thousand different database tables. To focus on designing an app without having to deal with content. The client can do that. I just want to code. But I dont want a full blown CMS, most apps I build just need a small taste of it but it still has to look pretty and fun. It's not meant to *invade* your rails project, just mainly requires that you use PostgreSQL. Are there other solutions? probably, I havn't really looked.

## Installation

Create New Rails Project:
```console
rails new app_name --database=postgresql
rake db:create
```

Add BrilliantCMS to your gemfile:

```ruby
gem 'brilliant_cms', '~> 0.0.1'
```
Run the bundle command to install.

Load migrations from BrilliantCMS

```console
rake brilliant_cms:install:migrations && rake db:migrate
```


## Usage

Visit your locolhost/admin to create an administrator account, registration is disabled after the first account is created (you can then add other admins from within the app)
(The engine is mounted at '/admin')

So far, Blog & Article models are available from the engine, use the BrilliantCms module in front of those classes in your app controller. Ex: 
```ruby
# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @posts = BrilliantCms::Article.all
  end

  def search
    @posts = BrilliantCms::Article.all.search(params[:query])
    render action: 'index'
  end
end
```

To create models in your rails app to use with/manage from the CMS engine, create the file:
```ruby
# app/models/some_kind_of_post.rb
class SomeKindOfPost < BrilliantCms::Entry
  searchable_attributes :title, :body

  content_attr :body, :text
  content_attr :lody, :string
  content_attr :dody, :string
  
  validates_presence_of :lody, :dody
end
```
Then create an initializer to configure:
```ruby
# config/initializers/brilliant_cms.rb
BrilliantCms.configure do |config|
  config.content_classes = %w(SomeKindOfPost SomeOtherClass)
end
```

## TODO
Tests, and bunch of stuff. I'll update as much as I can, as soon as I can. Open to contributions

## Screenshot
![Alt text](screenshot.png?raw=true "Remote Tool")