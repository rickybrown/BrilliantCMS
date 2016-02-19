$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brilliant_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brilliant_cms"
  s.version     = BrilliantCms::VERSION
  s.authors     = ["Ricky Brown"]
  s.email       = ["ricky@brilliantdeveloping.com"]
  s.homepage    = "http://brilliantdeveloping.com"
  s.summary     = "Summary of BrilliantCms."
  s.description = "Description of BrilliantCms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "coffee-rails", "~> 4.1.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "bootstrap-sass", "~> 3.3.6"
  s.add_dependency "font-awesome-rails"
  s.add_dependency "autoprefixer-rails"
  s.add_dependency "simple_form", "~>3.1.0"
  s.add_dependency "devise", "3.5.1"
  s.add_dependency "pygments.rb"
  s.add_dependency "redcarpet"

  s.add_development_dependency "pg"
end
