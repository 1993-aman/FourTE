RailsAdmin.config do |config|

  config.model Post do
    edit do
      # For RailsAdmin >= 0.5.0
      field :content, :ck_editor
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
      field :user
      field :comments
    end
  end

  
end
