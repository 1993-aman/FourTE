Rails.application.config.to_prepare do
  RailsAdmin::ApplicationController.class_eval do
    before_action :reload_rails_admin, if: :reload_rails_admin? # Reloading RailsAdmin Config Automatically

    def reload_rails_admin
      RailsAdmin::Config.reset

      load("#{Rails.root}/config/initializers/rails_admin.rb")

      Dir.foreach("#{Rails.root}/config/initializers/rails_admin") do |item|
        next if item == '.' or item == '..'
        load("#{Rails.root}/config/initializers/rails_admin/#{item}")
      end
    end

    def reload_rails_admin?
      Rails.env.development?
    end
  end
end