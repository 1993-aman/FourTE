	source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
gem 'rails', '5.0.2'

##Security
gem 'devise'
gem 'linkedin'
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin-oauth2'
gem 'omniauth-twitter'

gem 'cancancan'
gem 'table_print'
gem 'high_voltage', '~> 3.0.0'

gem 'figaro'
## Core Gems

gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'paperclip-cloudinary'
if RUBY_PLATFORM =~ /mingw32/
  gem 'mini_magick', :path => '../minimagick', :ref => '6d0f8f953112cce6324a524d76c7e126ee14f392'
else
  gem "mini_magick"
end

gem 'ckeditor'
## Front-end Gems
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'

#ADMIN
gem 'rails_admin', '~> 1.2'


#PAGINATION
gem 'kaminari-mongoid'

##DESIGN
gem 'bootstrap'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

gem 'jquery-rails'
gem 'bootstrap-select-rails'
gem 'simple_form'
gem 'wow-rails'	
##
gem 'redcarpet' # For the Markdown parsing
gem 'coderay' # Syntax highlighting



## Database Gems
 gem 'mongoid'
 gem 'bson_ext'
 gem 'moped'
 gem 'mongoid-slug'


## Donot Gemify Assets	

group :development, :test do
  gem 'listen', '~> 3.0.5'
  gem 'byebug'
  gem 'web-console'
  gem 'spring'
  gem "thin"
end

