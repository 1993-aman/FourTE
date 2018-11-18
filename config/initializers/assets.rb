# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
 Rails.application.config.assets.precompile += %w( blog/clean-blog.scss sign_page/style.css admin.js admin.css theme.js theme.css admin.js admin.css application.js application.css awesome.js awesome.css blog.js blog.css doubts.js doubts.css opinions.js opinions.css profile.js profile.css theme.js theme.css)
Rails.application.config.assets.precompile += %w( ckeditor/*)